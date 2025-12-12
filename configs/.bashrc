#
# ~/.bashrc
#

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ]; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

#shopt
#shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

# auto compelte even after sudo
complete -cf sudo

# solve problem "nocorrect not found"
# because nocorrect is only in zsh
# and we have aliases like "nocorrect mkdir"
alias nocorrect='command'

# Fzf autocomplete
if [ -x "$(command -v fzf)" ]; then
    export FZF_BASE=$(which fzf)
    DISABLE_FZF_KEY_BINDINGS="false"

    if [ -x "$(command -v gf)" ]; then
        export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" --follow'
    fi

    # vim **-tab-tab
    # kill **-tab-tab
    # ctrl-r
    # alt-c
    source <(fzf --bash)
fi

[[ -f ~/.aliases.sh ]] && . ~/.aliases.sh
[[ -f ~/.site.sh ]] && . ~/.site.sh

if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init bash --hook pwd --cmd x)"
fi

if [ -x "$(command -v python3)" ]; then
    PYTHON_BIN_PATH="$(python3 -m site --user-base)/bin"
    export PATH="$PATH:$PYTHON_BIN_PATH"
fi

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

#. "$HOME/.local/share/../bin/env"
