# rbenv
RBENV_HOME="$HOME/.local/rbenv"
eval "$($RBENV_HOME/bin/rbenv init - zsh)"

# Cargo
. "$HOME/.cargo/env"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# pnpm
export PNPM_HOME="$HOME/.pnpm"
