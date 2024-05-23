import { defineConfig } from "https://deno.land/x/gh_rd/mod.ts";

export default defineConfig({
  tools: [
    { name: "bootandy/dust" },
    { name: "BurntSushi/ripgrep" },
    { name: "casey/just" },
    { name: "chmln/sd" },
    {
      name: "direnv/direnv",
      rename: [
        { from: "direnv*", to: "direnv" }
      ]
    },
    { name: "ismaelgv/rnr" },
    {
      name: "jqlang/jq",
      executables: [
        { glob: "jq-*", as: "jq" }
      ]
    },
    { name: "junegunn/fzf" },
    { name: "rossmacarthur/sheldon" },
    { name: "sharkdp/bat" },
    { name: "sharkdp/fd" },
    { name: "upx/upx" },
  ],
});
