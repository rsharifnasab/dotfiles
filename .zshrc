export GOPATH="$HOME/go"

export PATH="$PATH:\
$HOME/bin:\
$(go env GOPATH)/bin:\
$HOME/.local/bin"


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh/"



###############
##set zsh theme
###############
ZSH_THEME="robbyrussell"
ZSH_THEME="half-life"
ZSH_THEME="random"

ZSH_FAVLIST="$HOME/.zsh_favlist"
ZSH_THEME_RANDOM_CANDIDATES=()
for theme in $(cat $ZSH_FAVLIST);  do
    ZSH_THEME_RANDOM_CANDIDATES+=($theme)
done


setopt NO_GLOB_COMPLETE
setopt autolist      # Display completion candidates immediately.
setopt listtypes     # When listing files that are possible completions,
                     # indicate their types with a trailing character.
setopt nolistbeep    # No bell on ambiguous completion!!

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

    colored-man-pages
    copyfile #copy content of file to clipboard

    sudo # esc esc -> add sudo to command

    extract # extract any archive
    fzf # fzf integrated to zsh

    golang # completion for go as well as aliases
    rust # completion for rust, rustup, cargo
    stack # completion for stack

    z # most freq used dirs

    fancy-ctrl-z # enter ctrl-z instead of fg<enter>

    web-search # search web

    #zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh


export FZF_BASE=/usr/bin/fzf
DISABLE_FZF_KEY_BINDINGS="false"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# solve slow paste issue (cause:zsh-autosuggestions)
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

export MANPATH="/usr/local/man:$MANPATH"

# use bat as man pager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
    export SUDO_EDITOR="vim"
else
    export EDITOR='nvim'
    export VISUAL='nvim'
    export SUDO_EDITOR="nvim"
fi

# ignore non meaningful commands from history
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..|sss)"


#############
## ALIASES ##
#############


## safer commands
alias rm='rm -I --preserve-root'
alias mc='mv -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# shorter commands
alias ls='ls --classify --human-readable -1 --color=auto'
alias l.="ls -A | egrep '^\.'"
alias l='ls --classify --human-readable -1 --color=auto -lAh'
alias cdls='cd "$@" && ls' # cd and ls in the same time!
alias cls='cd "$@" && ls'  # cd and ls in the same time!
alias cd..='cd ..' 
alias mkdir="mkdir -pv"
alias cpv='rsync -ah --info=progress2' # copy with progressbar

alias v='nvim'
alias f="xdg-open"

alias gd="gcc -lstdc++ -Wall -Wextra -O0 -g -Ddebug"
alias g=" gcc -lstdc++ -Wall -Wextra -O0 -g"

alias pacman="sudo pacman --color auto"

alias jctl="journalctl -p 3 -xb" # get journalctl error messages

# what if I mistyped clear?
alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'

# emacs client, needs emacs session running
alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'

# reload new config files from dotfiles
# changes in sync_home will effect after second reload!
alias r="clear; sync_home && exec zsh || echo 'error in syncing'"

# git aliases
alias got='git'
alias fir='git'
alias glog='git log --graph --oneline --decorate --abbrev-commit --all'
alias gstat="git status -sb"
alias gstatv="git status -vv"
alias gadd="git add" 
alias gcom="git commit -m"
alias gcome="git commit" # open editor!
alias gpush="git push"
alias gpull="git pull"
alias gdiff="git diff HEAD --color-words"
alias gfetch="git fetch --all --prune"
alias gloc="git ls-files | xargs wc -l"
alias gclon="git clone --depth 1 --branch "

# go aliases 
alias gor="go run"
alias gob="go build"
alias goc="go clean"
alias gott="go test"
alias gop='cd $GOPATH'


alias junit="cp -r \
    ~/pro*/*utils/junit_test_runner/* ." 
    # make current folder ready for run junit tests

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' \
    | column -t | egrep ^/dev/ | sort" # view mounted drives

alias mem='cat /proc/meminfo | grep Avail | awk '\'' { print "Available Memory: " $2/1024/1024 " GB" }'\'' '

alias last_commands="history | awk '{print \$4}' | sort | uniq -c | sort -n | tail -20"

alias redsh="redshift  -b 0.79:0.65  -l 35.74:51.33"

# command with exteral tools
#
alias vid_len="find . -maxdepth 1 -iname '*.*' -exec ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; | awk '{sum += \$0} END{print sum/60 \" min\"}' "

alias clip_set="xclip -selection c" 
alias clip_get="xclip -selection c -o"
alias clock='tty-clock -s -S -c -t -C 6 -b' # open beautiful clock


# command with help of online resources
alias tb="nc termbin.com 9999" # copy to online clipboard
alias excuse="w3m http://developerexcuses.com/ | head -3 | xargs -o"


hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

function wea() {
    local request="wttr.in/${1-tehran}?Fq"
    [ "$(tput cols)" -lt 125 ] && request+='n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
alias wea1='curl -s "wttr.in/TEHRAN?format=3"' # one liner: how is the weather?
alias weac='curl -s "wttr.in/TEHRAN?F0"' # current weather 
alias weaf='curl -s "wttr.in/TEHRAN?Fq"' # 3 day forecast
alias mkdirp='mkdir -p' # create parent folders too

# check network
alias ccc='dig +short myip.opendns.com @resolver1.opendns.com'
alias ccv="host myip.opendns.com resolver1.opendns.com\
    | grep 'myip.opendns.com has'\
    | awk '{print \$4}'"
alias nw="watch -n 3 -t -d -b  $(alias ccc | cut -d\' -f2)"
alias nws="wget -O /dev/null \
    http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

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

# select with fzf open file in gui
function fo() {
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && xdg-open "${files[@]}"
}

# select with fzf open selected folder in file manager
function fm() {
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))

    if command -v thunar &> /dev/null # xfce
    then 
        [[ -n "$files" ]] && exec thunar "${files[@]}" # gnome
    elif command -v nautilus &> /dev/null
    then 
        [[ -n "$files" ]] && exec nautilus --no-desktop "${files[@]}"
    else 
        [[ -n "$files" ]] && exec xdg-open "$(dirname "${files[@]}")"
    fi
}

# find mp3 file in cwd
function fmm() {
    NAME=$1
    files=$(locate "/$NAME.mp3")
    if command -v thunar &> /dev/null # xfce
    then 
        [[ -n "$files" ]] && exec thunar "${files[@]}" # gnome
    elif command -v nautilus &> /dev/null
    then 
        [[ -n "$files" ]] && exec nautilus --no-desktop "${files[@]}"
    else 
        [[ -n "$files" ]] && exec xdg-open "$(dirname "${files[@]}")"
    fi
}

# open folder containing current playing track
function fvlc() {
    files=$(lsof -p `pidof -s vlc` | tail -1 | sed -nr 's#.*(/home.*$)#\1#p')
    if command -v thunar &> /dev/null # xfce
    then 
        [[ -n "$files" ]] && exec thunar "${files[@]}" # gnome
    elif command -v nautilus &> /dev/null
    then 
        [[ -n "$files" ]] && exec nautilus --no-desktop "${files[@]}"
    else 
        [[ -n "$files" ]] && exec xdg-open "$(dirname "${files[@]}")"
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

function play_vlc_sub(){
    # play a serial episode with vlc
    vlc *$1* --sub-file *$1*.srt
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

# use gnu hightlight for add syntax hight to less
function color(){
    src-hilite-lesspipe.sh "$@" | less
}


# cd and ls at same time
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
      ls
}


SAFE_RM='/usr/bin/safe-rm'
if test -f "$SAFE_RM"; then
    alias rm="$SAFE_RM"
fi

# platform specific configs
type apt >/dev/null 2>&1 && source ~/.debian_config || true

# nice visualization
# pfetch 
# colorscript -e 16
