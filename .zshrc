export PATH=/home/roozbeh/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/roozbeh/.oh-my-zsh/"


###############
##set zsh theme
###############
ZSH_THEME="robbyrussell"
ZSH_THEME="half-life"
ZSH_THEME="random"

ZSH_FAVLIST="/home/roozbeh/.zsh_favlist"
ZSH_THEME_RANDOM_CANDIDATES=()
for theme in $(cat $ZSH_FAVLIST);  do
    ZSH_THEME_RANDOM_CANDIDATES+=($theme)
done


setopt NO_GLOB_COMPLETE

# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true" # automatically update without prompting.
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    zsh-autosuggestions
    zsh-syntax-highlighting

    sudo

    git
    extract
    fzf

    rust rustup cargo
    golang
    stack

    z # most freq used dirs
    history-substring-search
    vi-mode
)
source $ZSH/oh-my-zsh.sh


export FZF_BASE=/usr/bin/fzf
DISABLE_FZF_KEY_BINDINGS="false"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# solve slow paste issue (cause:zsh-autosuggestions)
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
    export SUDO_EDITOR="nvim"
else
    export EDITOR='nvim'
    export VISUAL='nvim'
    export SUDO_EDITOR="nvim"
fi


#############
## ALIASES ##
#############


## safer commands
alias rm='rm -I --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# what if I mistyped clear?
alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'

# emacs client, needs emacs session running
alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'

# reload new config files from dotfiles
alias r="clear; sync; exec zsh"

# git aliases
alias glog='git log --graph --oneline --decorate --abbrev-commit'
alias gstat="git status"
alias gadd="git add" gcom="git commit -m"
alias gpush="git push" gpull="git pull"


alias junit="cp -r \
    ~/pro*/*utils/junit_test_runner/* ." # make current folder ready for run junit tests
alias clock='tty-clock -s -S -c -t -C 6 -b' # open beautiful clock
alias hdd='clear; df --all -h |\
    grep --color=never "/dev/sda*"' # disks usage
alias wea='curl -s "wttr.in/TEHRAN"' # how is the weather?
alias mkdirp='mkdir -p' # create parent folders too
alias line='find * -type f | xargs  wc -l' # how many lines are in current dir project

# check network
alias ccc='curl -q icanhazip.com'
alias ccv='dig +short myip.opendns.com @resolver1.opendns.com'
alias ccb="host myip.opendns.com resolver1.opendns.com\
    | grep 'myip.opendns.com has'\
    | awk '{print \$4}'"
alias nw="watch -n 3 -t -d -b  $(alias ccc | cut -d\' -f2)"

# download with wget
alias dllist='wget -c -i list.txt'
alias wget='wget -c'

# bye
alias :q=exit
alias sss='shutdown now'
alias ssc='shutdown -c'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorx='sudo reflector --age 6 --latest 20 --fastest 20 \
    --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'


#####################
### FZF functions ###
#####################

function fkill(){
    local pid

    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m  --height=50% --layout=reverse | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m --height=50% --layout=reverse | awk '{print $2}')
    fi
    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# select with fzf open file with vim
function fe() {
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# select dir and cd to it. including hidden directories
function fzfd(){
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# search from history (fzf) to repeat
function fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# search (fzf) and install package with yay
function in() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

# search (fzf) and remove package with yay
function re() {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}

# same as nnn but with fzf and bash
function nn() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                    __cd_nxt="$(echo {})";
                    __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                    echo $__cd_path;
                    echo;
                    ls -p --color=always "${__cd_path}";
                    ')"
                    [[ ${#dir} != 0 ]] || return 0
                    builtin cd "$dir" &> /dev/null
                done
}


#################
##run a command##
#################

# exit-cd nnn with ctrl g
# open it with `n`
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

# open typora even if file does not exist
function typ(){
    if [ ! -f $@ ]; then
        touch "$@"
    fi
    typora "$@"
}



# # ex = EXtractor for all kinds of archives
ex ()
{
  if [[ $# -ne 1 ]] ; then
    echo "   usage: ex <file>"
    return
  fi
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' is not a valid zip file" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# Created by fodev.org
function fod(){
    case $1 in
        "--enable" | "-e")
            export http_proxy=http://fodev.org:8118/
            export https_proxy=https://fodev.org:8118/
            export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
            export HTTP_PROXY=http://fodev.org:8118/
            export HTTPS_PROXY=https://fodev.org:8118/
            export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"
            echo "enable fod proxy !"
        ;;
        "--disable" | "-d")
            unset http_proxy
            unset https_proxy
            unset no_proxy
            unset HTTP_PROXY
            unset HTTPS_PROXY
            unset NO_PROXY
            echo "disable fod proxy !"
        ;;
        *)
            echo "Usage : fod [-e | --enable] [-d | --disable]"
            echo "Example : "
            echo "  fod --enable for enable fod proxy "
            echo "  fod --disable for disable fod proxy "
        ;;
    esac
}




# Color of man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"



SAFE_RM='/usr/bin/safe-rm'
if test -f "$SAFE_RM"; then
    alias rm="$SAFE_RM"
fi

