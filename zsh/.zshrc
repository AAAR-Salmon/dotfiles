## Created by newuser for 5.8.1

## Reset keybinds
bindkey -d
bindkey -e

## Load plugins
eval "$(sheldon source)"

## Configure completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher 'm:{a-z}={A-Z}'
# https://qiita.com/minnsou/items/3e9f200f9f2cc9a92920
zstyle ':completion:*' completer _complete _approximate _prefix

## Config command history
export HISTFILE="$HOME/.history"
export HISTSIZE=1000
export SAVEHIST=10000
# Save history immediately
setopt incappendhistory

## Set prompt color
zstyle ':prompt:pure:path' color cyan
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red
zstyle ':prompt:pure:git:stash' show true

## Alias
alias rm='trash-put'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls --color=auto'
function mkcd() {
  mkdir $1 && cd $1
}
function cd-git-dir() {
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    return 1
  fi
  cd "$(git rev-parse --show-toplevel)"
}

export ABBR_FORCE=1
export ABBR_QUIET=1

## Plugins integration
command -v fzf >/dev/null && eval "$(fzf --zsh)"
export PAGER="less -S"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
