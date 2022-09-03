#############
## ALIASES ##
#############


## safer commands
alias rm='rm -I --preserve-root'
alias mc='nocorrect mv -i'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias ln='ln -i'

SAFE_RM='/usr/bin/safe-rm'
if test -f "$SAFE_RM"; then
    alias rm="$SAFE_RM"
fi



# Preserve changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# shorter commands

alias j='jdate -u +"%Y/%m/%d"'
alias f="xdg-open"
alias f.="xdg-open ."
alias v='nvim'
# emacs client, needs emacs session running
alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias free="free -mht"

alias ls='ls --classify --human-readable -1 --color=auto'
alias l='ls --classify --human-readable -1 --color=auto -lAh'
alias l.="ls -A | egrep '^\.'"
alias sl='ls'

LSD_COMMAND="/usr/bin/lsd"
if test -f "$LSD_COMMAND"; then
    alias ls='lsd    -Fh1    --color=auto            --group-dirs first'
    alias lsize='lsd -Fh1l   --color=auto --sizesort                    --total-size'
    alias l='lsd     -Fh1lA  --color=auto --sizesort --group-dirs first'
    alias tree='lsd  -Fh1    --color=auto            --group-dirs first --tree'
fi


alias cd..='cd ..' 
alias mkdir="nocorrect mkdir -pv"
alias cpv='rsync -ah --info=progress2' # copy with progressbar
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

alias pacman="sudo pacman --color auto"
alias jctl="journalctl -p 3 -xb" # get journalctl error messages

alias gd="gcc -lstdc++ -Wall -Wextra -O0 -g -Ddebug"
alias g=" gcc -lstdc++ -Wall -Wextra -O0 -g"

# download in  terminal
alias wget='wget -c'
alias dllist='wget -c -i list.txt'
alias aria2='aria2c -c -x8 -s8 -j1 --summary-interval=0'
alias arialist='aria2c -c -x8 -s8 -j1 --summary-interval=0 -i list.txt'

# what if I mistyped clear?
alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'


# bye
alias :q=exit
alias sss='shutdown now'
alias سسس='shutdown now'
alias ssc='shutdown -c'


# git aliases
alias got='git'
alias gut='git'
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
alias go="nocorrect go"
alias gor="go run"
alias gob="go build ."
alias goc="go clean"
alias gott="go test './...' -cover"
alias gop='cd $GOPATH'


# command with extenral tools
# make current folder ready for run junit tests
alias junit="cp -r  ~/pro*/*utils/junit_test_runner/* ." 
alias redsh="redshift  -b 0.79:0.65  -l 35.74:51.33"
alias clip_set="xclip -selection c" 
alias clip_get="xclip -selection c -o"
alias clock='tty-clock -s -S -c -t -C 6 -b' # open beautiful clock
alias qrcode="qrencode -t ansiutf8"
alias ipython="python -m IPython"
alias ipy="python -m IPython"
alias psrc="source ~/apps/venv/bin/activate"
alias yay="paru"

# check network
alias ccc='dig +short myip.dnsomatic.com @resolver1.opendns.com'
alias ccv='dig +short myip.opendns.com @resolver1.opendns.com'
alias nw="watch -n 3 -t -d -b  $(alias ccc | cut -d\' -f2)"

# command with help of online resources
alias tb="nc termbin.com 9999" # copy to online clipboard
alias excuse="w3m http://developerexcuses.com/ | head -3 | xargs -o"

# check the weather 
function wea() {
    local request="wttr.in/${1-tehran}?Fq"
    [ "$(tput cols)" -lt 125 ] && request+='n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
alias wea1='curl -s "wttr.in/TEHRAN?format=3"' # one liner: how is the weather?
alias weac='curl -s "wttr.in/TEHRAN?F0"' # current weather 
alias weaf='curl -s "wttr.in/TEHRAN?Fq"' # 3 day forecast


# open typora even if file does not exist
function typ(){
    if [ ! -f $@ ]; then
        touch "$@"
    fi
    typora "$@"
}

# use gnu hightlight for add syntax hight to less
function gat(){
    src-hilite-lesspipe.sh "$@" | less
}


# cd and ls at same time
function cls() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
      ls
}


function mnt(){
    mount | awk -F' ' '{ printf "%s\t%s\n",$1,$3; }' \
        | column -t | grep -E "^/dev/" | sort
}

function mem(){
    grep "Avail" /proc/meminfo | \
        awk ' { print "Available Memory: " $2/1024/1024 " GB" }'
}

function hdd() {
  hdd="$(df -h | awk 'NR==4{print $3, $5}')"
  echo -e "HDD: $hdd"
}

function last_commands(){
    history | awk '{print $4}' | sort | uniq -c | sort -n | tail -20
}


function vlc_sub(){
    vlc -q *$1* --sub-file *$1*.srt
}

# sum of all videos in the current folder
function sum_vid_len(){
    dir="$1"
    find "$dir" -maxdepth 1 -iname '*.*' -exec \
        ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; \
        | awk '{sum += $0} END{print sum/60 "min"}'
}

function clean_disk(){
    echo "cleaning paru"
    paru -Sc
    echo "cleaning pacman"
    sudo "pacman" -Scc
    echo "cleaning pip"
    rm -r ".cache/pip"
    echo "cleaning journalctl"
    sudo journalctl --vacuum-size=100M
    echo "cleaning recyclebin"
    sudo "rm" -rf /home/*/.local/share/Trash/files/* || true
    sudo "rm" -rf /home/*/.local/share/Trash/files/.* || true
}


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
        [[ -n "$files" ]] && thunar "${files[@]}" # gnome
    elif command -v nautilus &> /dev/null
    then 
        [[ -n "$files" ]] && nautilus --no-desktop "${files[@]}"
    else 
        [[ -n "$files" ]] && xdg-open "$(dirname "${files[@]}")"
    fi
}

# find mp3 file in cwd
function fmm() {
    NAME=$1
    files=$(locate "/$NAME.mp3")
    echo "$files"
    if command -v thunar &> /dev/null # xfce
    then 
        [[ -n "$files" ]] && thunar "${files[@]}" # gnome
    elif command -v nautilus &> /dev/null
    then 
        [[ -n "$files" ]] && nautilus --no-desktop "${files[@]}"
    else 
        [[ -n "$files" ]] && xdg-open "$(dirname "${files[@]}")"
    fi
}

# open folder containing current playing track
function fvlc() {
    files=$(lsof -p `pidof -s vlc` | tail -1 | sed -nr 's#.*(/home.*$)#\1#p')
    if command -v thunar &> /dev/null # xfce
    then 
        [[ -n "$files" ]] &&  thunar "${files[@]}" # gnome
    elif command -v nautilus &> /dev/null
    then 
        [[ -n "$files" ]] &&  nautilus --no-desktop "${files[@]}"
    else 
        [[ -n "$files" ]] && xdg-open "$(dirname "${files[@]}")"
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

# search (fzf) and install package with paru
function in() {
    paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}'| xargs -ro paru -S
}

# search (fzf) and remove package with paru
function re() {
    paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

#########
## ETC ##
#########

# exit-cd nnn with ctrl g
# open it with `n`
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi


