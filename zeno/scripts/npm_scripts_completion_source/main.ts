#!/usr/bin/env -S deno run --allow-read --allow-env

import { unicodeWidth } from "@std/cli/unicode-width";
import { red as _red } from "@std/fmt/colors";
import { dirname, join } from "@std/path";
import { Console, Effect, Option, pipe, Stream } from "effect";
import { z } from "zod";
import {
  type AppError,
  DirectoryNotFoundError,
  FileHandleError,
  NotInProjectError,
  PackageJsonParseError,
  PermissionLackError,
} from "./lib/error.ts";

/**
 * symlink を辿った先の realPath を得る
 * そもそも存在しない場合は none を返す
 */
const getRealPath = (
  path: string,
): Effect.Effect<Option.Option<string>, PermissionLackError> =>
  pipe(
    Effect.try(() => Option.some(Deno.realPathSync(path))),
    Effect.catchAll((e) =>
      e instanceof Deno.errors.NotCapable
        ? Effect.fail(new PermissionLackError("read"))
        : Effect.succeed(Option.none())
    ),
  );

/**
 * 通常ファイルかどうかを判定する
 */
const isFile = (path: string) =>
  pipe(
    Effect.try(() => Deno.statSync(path).isFile),
    Effect.catchAll((e) =>
      e instanceof Deno.errors.NotCapable
        ? Effect.fail(new PermissionLackError("read"))
        : Effect.succeed(false)
    ),
  );

const getDirname = (path: string) =>
  pipe(
    Effect.try(() => dirname(path)),
    Effect.catchAll((e) =>
      e instanceof Deno.errors.NotCapable
        ? Effect.fail(new PermissionLackError("read"))
        : Effect.die(e)
    ),
  );

/**
 * startDir から上に辿っていって filename が見つかるまで探す
 */
function findUpFile(
  startDir: string,
  filename: string,
): Effect.Effect<Option.Option<string>, PermissionLackError> {
  const candidateDirs = Stream.unfoldEffect(
    startDir,
    (dir) =>
      pipe(
        getDirname(dir),
        Effect.map((parent) =>
          // 同じディレクトリになったら生成を止める
          dir === parent ? Option.none() : Option.some([dir, parent])
        ),
      ),
  );
  const candidatePaths = candidateDirs.pipe(
    Stream.map((currentDir) => join(currentDir, filename)),
  );

  // Stream.runHead(Stream.findEffect) は冗長だけどもうちょっと良い書き方はないの？
  return Stream.runHead(
    Stream.findEffect(candidatePaths, (candidatePath) =>
      pipe(
        getRealPath(candidatePath),
        Effect.flatMap(
          Option.match({
            onSome: (realPath) => isFile(realPath),
            onNone: () => Effect.succeed(false),
          }),
        ),
      )),
  );
}

interface Script {
  command: string;
  script: string;
}

const packageJsonSchema = z.object({
  scripts: z.record(z.string(), z.string()).optional(),
});

function getScripts(
  json: unknown,
): Effect.Effect<Script[], PackageJsonParseError> {
  return Effect.gen(function* () {
    const parseResult = packageJsonSchema.safeParse(json);

    if (!parseResult.success) {
      return yield* Effect.fail(new PackageJsonParseError());
    }

    const packageJson = parseResult.data;

    if (!packageJson.scripts) {
      return [];
    }

    const scripts = Object.entries(packageJson.scripts).map(
      ([command, script]) => {
        return { command, script };
      },
    );

    return scripts;
  });
}

// Format scripts with proper column alignment using unicode-width
function formatScripts(scripts: Script[]): string {
  if (scripts.length === 0) {
    return "";
  }

  // Calculate maximum width of command column
  const maxCommandWidth = Math.max(
    ...scripts.map((s) => unicodeWidth(s.command)),
  );

  // Format each line with proper padding (2 spaces between columns)
  const lines = scripts.map((s) => {
    const commandWidth = unicodeWidth(s.command);
    const padding = " ".repeat(maxCommandWidth - commandWidth + 2);
    return `${s.command}${padding}${s.script}`;
  });

  return lines.join("\n");
}

const program: Effect.Effect<void, AppError> = Effect.gen(function* () {
  const cwd = yield* Effect.try({
    try: () => Deno.cwd(),
    catch: () => new DirectoryNotFoundError("."),
  });

  // Find package.json
  const packageJsonPathOption = yield* findUpFile(cwd, "package.json");
  const packageJsonPath = yield* Effect.gen(function* () {
    if (Option.isNone(packageJsonPathOption)) {
      return yield* Effect.fail(new NotInProjectError(cwd));
    }
    return packageJsonPathOption.value;
  });

  // Read and parse package.json
  const content = yield* Effect.tryPromise({
    try: () => Deno.readTextFile(packageJsonPath),
    catch: () => new FileHandleError(),
  });

  const json = yield* Effect.try({
    try: () => JSON.parse(content),
    catch: () => new PackageJsonParseError(),
  });

  // Extract scripts
  const scripts = yield* getScripts(json);

  // Format and output
  const output = formatScripts(scripts);
  if (output) {
    console.log(output);
  }
});

Effect.runFork(
  program.pipe(
    Effect.tapError((e) => Console.error(e.message)),
  ),
);
