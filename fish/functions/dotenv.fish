function dotenv --description "Run with .env"
    set --local options 'h/help' 'f/file=+'

    argparse --name dotenv $options -- $argv; or return

    if set --query _flag_help
        echo 'Usage: dotenv [OPTIONS] COMMAND'
        echo
        echo 'Options:'
        echo '    -h, --help          Display this message'
        echo '    -f, --file FILE     Load from .env file'
        return 0
    end

    for envfile in $_flag_file
        for row in (cat $envfile)
            set -x (echo $row | perl -pe 's/^([a-zA-Z0-9_]+)=.*$/$1/') (echo $row | perl -pe 's/^[a-zA-Z0-9_]+=(?:"(.*)"|(.*))$/$1$2/')
        end
    end

    $argv
end
