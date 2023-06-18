# Aliases
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# Abbreviations
abbr -a c clear
abbr -a stop kill -TERM
abbr -a kill kill -KILL
## ls
abbr -a l ls
abbr -a ll ls -lh
abbr -a la ls -A
## git
abbr -a gs git status
abbr -a ga git add
abbr -a gap git add -p
abbr -a gan git add -N
abbr -a gc git commit
abbr -a gcm git commit -m
abbr -a gcz git cz
abbr -a gca git commit --amend
abbr -a gcan git commit --amend --no-edit
abbr -a gpp git pull --prune
abbr -a gsw git switch
abbr -a gl git log
abbr -a glo git log --oneline -10
## docker
abbr -a dps docker ps -a
abbr -a di docker images -a
abbr -a dcu docker compose up -d
abbr -a dcd docker compose down
## tar
abbr -a xgz tar vxzf
abbr -a xbz tar vxjf
abbr -a xxz tar vxJf

# Loads local config
if [ -r ~/.config.local.fish ]
	. ~/.config.local.fish
end
