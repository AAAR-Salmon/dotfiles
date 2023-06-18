function git-branch-gc --description "Delete merged branches"
    set --local options 'h/help'

    argparse --name git-branch-gc $options -- $argv; or return

    if set --query _flag_help
        echo 'Usage: git-branch-gc [BASE_BRANCH]'
        echo
        echo 'Options:'
        echo '    -h, --help          Display this message'
        return 0
    end

    if [ -z $argv ]
        set argv (git symbolic-ref refs/remotes/origin/HEAD | awk -F/ '{print $NF}')
    end

    for base_branch in $argv
        git branch --merged $base_branch | grep --invert-match $base_branch | xargs git branch -d
    end
end
