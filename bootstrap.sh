#!/usr/bin/env bash

function restart_doom(){
    echo "syncing doom"
    ~/.emacs.d/bin/doom -d sync

    echo "kill emacs daemon"
    #emacsclient -e 'doom/reload'
    emacsclient -e '(kill-emacs)'

    echo "re-open emacs daemon"
    emacs --daemon
}


function bootstrap(){
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit
    git pull origin master;
    ./bin/sync
    restart_doom
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
    bootstrap
else
    read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        bootstrap
    fi;
fi;

unset bootstrap;
unset restart_doom;
