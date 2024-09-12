# Reset keybinds
bindkey -d
bindkey -e

# Load plugins
eval "$(sheldon source)"

# Configure completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher 'm:{a-z}={A-Z}'
## https://qiita.com/minnsou/items/3e9f200f9f2cc9a92920
zstyle ':completion:*' completer _complete _approximate _prefix

# Config command history
export HISTFILE="$HOME/.history"
export HISTSIZE=1000
export SAVEHIST=10000
## Save history immediately
setopt incappendhistory

# Alias
alias rm='gomi'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls --color=auto'
function cd-git-dir() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return 1
  fi
  cd "$(git rev-parse --show-toplevel)"
}

# aqua managed tools config
## aqua
export AQUA_ROOT_DIR="$HOME/.local/share/aquaproj-aqua"
export AQUA_GLOBAL_CONFIG="$DOTFILES/aquaproj-aqua/aqua.yaml"
export PATH="$PATH:$AQUA_ROOT_DIR/bin"
source <($AQUA_ROOT_DIR/bin/aqua completion zsh)

## direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

## fzf
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
  export FZF_DEFAULT_COMMAND='fd -H'
  export FZF_CTRL_T_COMMAND='fd -H'
  export FZF_ALT_C_COMMAND='fd -H -t d'
fi

## zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# load local overrides
source "$ZDOTDIR/.zshrc.local"
