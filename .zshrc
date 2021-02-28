export PATH=/home/roozbeh/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/roozbeh/.oh-my-zsh/"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

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

# User configuration
export EDITOR="$(which nvim)"
export SUDO_EDITOR="$(which nvim)"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='nvim'
    export VISUAL='nvim'
fi

SAFE_RM='/usr/bin/safe-rm'
if test -f "$SAFE_RM"; then
    alias rm="$SAFE_RM"
fi



alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'

alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'

alias r="clear; sync; exec zsh"

alias glog='git log --graph --oneline --decorate --abbrev-commit'
alias gstat="git status" gadd="git add" gcom="git commit -m" gpush="git push" gpull="git pull"
alias junit="cp -r ~/pro*/*utils/junit_test_runner/* ."
alias myip='time curl ifconfig.me'
alias ccc='curl ifconfig.me'
alias clock='tty-clock -s -S -c -t -C 6 -b'
alias hdd='clear && df --all -h | grep  "/dev/sda*"'
alias mkdirp='mkdir -p'
alias network='watch -n 3 -t -d -b "curl -s ifconfig.me"'
alias rmi='rm -i'
alias sss='shutdown now'
alias ssc='shutdown -c'
alias wea='curl -s "wttr.in/TEHRAN"'
alias :q=exit
alias line='find * -type f  | xargs  wc -l'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorx='sudo reflector --age 6 --latest 20 --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'

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

# slect dir and cd to it. including hidden directories
function fzfd(){
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

#history repeat
function fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# install with yay
function in() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

#remove with yay
function re() {
    yay -Qq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}


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


# exit-cd nnn with ctrl g
# open it with `n`
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi


function typ(){
    if [ ! -f $@ ]; then
        touch "$@"
    fi
    typora "$@"
}



# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
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
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


# solve slow paste issue (cause:zsh-autosuggestions)
zstyle ':bracketed-paste-magic' active-widgets '.self-*'


# Color of man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
