const APP_ERROR_SYMBOL = Symbol();

export interface AppError extends Error {
  [APP_ERROR_SYMBOL]: typeof APP_ERROR_SYMBOL;
}

abstract class AppErrorBase extends Error implements AppError {
  [APP_ERROR_SYMBOL]: typeof APP_ERROR_SYMBOL;

  constructor() {
    super();
    this.name = this.constructor.name;
    this[APP_ERROR_SYMBOL] = APP_ERROR_SYMBOL;
  }

  public isAppError(): boolean {
    return this[APP_ERROR_SYMBOL] === APP_ERROR_SYMBOL;
  }
}

export class PermissionLackError extends AppErrorBase {
  constructor(public permissionName?: Deno.PermissionName) {
    super();
    this.message = permissionName
      ? `Permission denied: ${permissionName}`
      : "Permission denied";
  }
}

export class DirectoryNotFoundError extends AppErrorBase {
  constructor(public directoryName?: string) {
    super();
    this.message = directoryName
      ? `Directory not found: ${directoryName}`
      : "Directory not found";
  }
}

export class NotInProjectError extends AppErrorBase {
  constructor(public directoryName?: string) {
    super();
    this.message = directoryName
      ? `Not in a project directory: ${directoryName}`
      : "Not in a project directory";
  }
}

export class FileHandleError extends AppErrorBase {
  constructor() {
    super();
    this.message = "Failed to handle file";
  }
}

export class PackageJsonParseError extends AppErrorBase {
  constructor() {
    super();
    this.message = "Failed to parse package.json";
  }
}
