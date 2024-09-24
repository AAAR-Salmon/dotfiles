use colored::Colorize;
use serde_json::Value as JsonValue;
use std::{
    env,
    fs::File,
    io::{stdout, BufReader, Write},
    iter,
    path::{Path, PathBuf},
    process,
};
use tabwriter::TabWriter;

fn main() {
    let Err(error) = try_main() else {
        return; // success
    };
    error.die()
}

fn try_main() -> Result<(), Error> {
    let Ok(pwd) = env::current_dir() else {
        return Err(Error::from(ErrorKind::GetPwdFailed));
    };
    let Some(source_file_path) = find_up_file(&pwd, "package.json") else {
        return Err(Error::from(ErrorKind::NotInProject));
    };
    let Ok(file) = File::open(&source_file_path) else {
        return Err(Error::from(ErrorKind::FileOpenFailed));
    };
    let reader = BufReader::new(&file);
    let Ok(package_json) = serde_json::from_reader::<_, JsonValue>(reader) else {
        return Err(Error::from(ErrorKind::JsonDeserializeFailed));
    };
    let scripts = get_scripts(&package_json)?;

    let mut tw = TabWriter::new(stdout()).padding(2);
    for Script { command, script } in scripts {
        tw.write_all(format!("{}\t{}\n", command, script).as_bytes())
            .unwrap();
    }
    tw.flush().unwrap();
    Ok(())
}

fn find_up_file(from: &Path, filename: &str) -> Option<PathBuf> {
    let mut dir = from.to_owned();
    let ancestor_dirs = iter::from_fn(move || {
        let yielded_dir = dir.clone();
        if let Some(parent) = dir.parent() {
            dir = parent.to_owned();
            Some(yielded_dir)
        } else {
            None
        }
    });
    ancestor_dirs
        .map(|dir| dir.join(filename))
        .find(|path| path.exists())
}

fn get_scripts(package_json: &JsonValue) -> Result<Vec<Script>, Error> {
    let Some(scripts) = package_json.get("scripts") else {
        return Ok(Vec::new());
    };
    let Some(scripts) = scripts.as_object() else {
        return Err(Error::from(ErrorKind::UnexpectedScriptsType));
    };
    scripts
        .into_iter()
        .map(|(command, script)| {
            let Some(script) = script.as_str() else {
                return Err(Error::from(ErrorKind::UnexpectedScriptsType));
            };
            Ok(Script {
                command: command.to_owned(),
                script: script.to_owned(),
            })
        })
        .collect::<Result<Vec<_>, _>>()
}

struct Script {
    command: String,
    script: String,
}

struct Error {
    kind: ErrorKind,
    message: String,
}

impl From<ErrorKind> for Error {
    fn from(kind: ErrorKind) -> Self {
        Self {
            kind,
            message: match kind {
                ErrorKind::GetPwdFailed => "Can't get current directory",
                ErrorKind::NotInProject => "package.json not found",
                ErrorKind::FileOpenFailed => "Can't open package.json",
                ErrorKind::JsonDeserializeFailed => "Can't deserialize package.json correctly",
                ErrorKind::UnexpectedScriptsType => r#"Unexpected "scripts" type"#,
            }
            .to_string(),
        }
    }
}

impl Error {
    fn die(&self) -> ! {
        eprintln!("{}", self.message.red());
        let exit_code = match self.kind {
            ErrorKind::GetPwdFailed => 1,
            ErrorKind::NotInProject => 2,
            ErrorKind::FileOpenFailed => 3,
            ErrorKind::JsonDeserializeFailed => 4,
            ErrorKind::UnexpectedScriptsType => 5,
        };
        assert_ne!(exit_code, 0);
        process::exit(1)
    }
}

#[derive(Debug, Clone, Copy)]
enum ErrorKind {
    GetPwdFailed,
    NotInProject,
    FileOpenFailed,
    JsonDeserializeFailed,
    UnexpectedScriptsType,
}
