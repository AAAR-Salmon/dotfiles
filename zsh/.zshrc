## Created by newuser for 5.8.1


## Load plugins
eval "$(sheldon source)"

## Configure completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher 'm:{a-z}={A-Z}'
# https://qiita.com/minnsou/items/3e9f200f9f2cc9a92920
zstyle ':completion:*' completer _complete _approximate _prefix

## Reset keybinds
bindkey -d

bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

## Config command history
export HISTFILE="$HOME/.history"
export HISTSIZE=1000
export SAVEHIST=10000

## Set prompt color
zstyle ':prompt:pure:path' color cyan
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red
zstyle ':prompt:pure:git:stash' show true

## Alias/Abbreviation
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

# not working zplug's tag of `use:`/`hook-load:` for some reason
source $HOME/.local/share/sheldon/repos/github.com/olets/zsh-abbr/zsh-abbr.plugin.zsh
export ABBR_FORCE=1
export ABBR_QUIET=1
abbr add --session ..='cd ..'
abbr add --session ...='cd ../..'
abbr add --session ....='cd ../../..'
abbr add --session l='ls -F'
abbr add --session la='ls -AF'
abbr add --session ll='ls -lhAF'
abbr add --session cg='cd-git-dir'
abbr add --session g='git'
abbr add --session gs='git status'
abbr add --session ga='git add'
abbr add --session gan='git add -N'
abbr add --session gap='git add -p'
abbr add --session gc='git commit'
abbr add --session gcm='git commit -m'
abbr add --session gca='git commit --amend'
abbr add --session gcan='git commit --amend --no-edit'
abbr add --session gd='git diff'
abbr add --session gf='git fetch --all --tags --prune'
abbr add --session gl='git log'
abbr add --session glo='git log --all --oneline --graph'
abbr add --session gg='git log --all --oneline --graph'
abbr add --session gp='git pull --prune'
abbr add --session d='docker'
abbr add --session v='nvim'
abbr add --session t='tmux'
abbr add --session f='fuck'

## Save history immediately
setopt incappendhistory

command -v fzf >/dev/null && eval "$(fzf --zsh)"
