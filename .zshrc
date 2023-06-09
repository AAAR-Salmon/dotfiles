# Created by newuser for 5.8.1

# Plugins
source ~/.zplug/init.zsh
## Self-manage zplug 
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'mafredri/zsh-async', as:plugin

zplug 'zsh-users/zsh-completions', as:plugin
zplug 'zsh-users/zsh-autosuggestions', as:plugin
zplug 'zsh-users/zsh-history-substring-search', as:plugin
zplug 'olets/zsh-abbr', as:plugin  # use not working

zplug 'sindresorhus/pure', use:pure.zsh, as:theme

if ! zplug check --verbose; then
  zplug install
fi
zplug load

# Reset keybinds
bindkey -d

bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

# Config command history
export HISTFILE="$HOME/.history"
export HISTSIZE=1000
export SAVEHIST=10000

# Set prompt color
zstyle ':prompt:pure:path' color cyan
zstyle ':prompt:pure:prompt:success' color green
zstyle ':prompt:pure:prompt:error' color red
zstyle ':prompt:pure:git:stash' show true

# Alias/Abbreviation
alias rm='trash-put'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls --color=auto'

## not working zplug's tag of `use:`/`hook-load:` for some reason
source $ZPLUG_REPOS/olets/zsh-abbr/zsh-abbr.zsh
export ABBR_FORCE=1
abbr add --session ..='cd ..'
abbr add --session ...='cd ../..'
abbr add --session ....='cd ../../..'
abbr add --session l='ls -F'
abbr add --session la='ls -AF'
abbr add --session ll='ls -lhF'
abbr add --session g='git'
abbr add --session gs='git status'
abbr add --session ga='git add'
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

# Load PATH settings
if [ -r $HOME/.path.zsh ]; then
  source $HOME/.path.zsh
fi

