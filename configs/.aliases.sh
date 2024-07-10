#!/usr/bin/bash
#############
## ALIASES ##
#############

## safer commands
alias rm='rm -I'
alias mc='nocorrect mv -i'
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias ln='ln -i'

if command -v safe-rm &>/dev/null; then
  alias rm="safe-rm -I"
fi

# Preserve changing perms on /
#alias chown='chown --preserve-root'
#alias chmod='chmod --preserve-root'
#alias chgrp='chgrp --preserve-root'

# shorter commands

#alias docker-compose='sudo docker-compose'
#alias docker='sudo docker'

if command -v xdg-open &>/dev/null; then
  alias opener="xdg-open"
  alias open="xdg-open"
elif command -v open &>/dev/null; then
  alias opener="open"
  alias xdg-open="open"
fi
alias f="opener"
alias f.="opener ."

function gui_opener() {
  if command -v thunar &>/dev/null; then # xfce
    [[ -n "$1" ]] && thunar "$1"
  elif command -v nautilus &>/dev/null; then # gnome
    [[ -n "$1" ]] && nautilus --no-desktop "$1"
  else
    opener "$(dirname "$1")"
  fi
}

alias rmr='rm -r'
alias cpr='cp -r'

# emacs client, needs emacs session running
alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grepi='grep --color=auto -i'
alias free="free -mht"

alias ls='ls -h -1 --color=auto'
alias l='ls -h -1 --color=auto -lAh'
alias l.="ls -A | egrep '^\.'"
alias sl='ls'
alias s='ls'

if command -v lsd &>/dev/null; then
  alias ls='lsd    -Fh1    --color=auto            --git --group-dirs first'
  alias lsize='lsd -Fh1l   --color=auto --sizesort --git                    --total-size'
  alias l='lsd     -Fh1lA  --color=auto --sizesort --git --group-dirs first'
  alias tree='lsd  -Fh1    --color=auto            --git --group-dirs first --tree'
fi

alias please="sudo "
alias sudo="sudo "
alias cd..='cd ..'
alias mkdir="mkdir -pv"
alias cpv='rsync -ah --info=progress2' # copy with progressbar
mkcd() { mkdir -p "$@" && eval cd "\"\$$#\""; }
dns() { dig "$@" "+short"; }

alias pacman="sudo pacman --color auto"
alias jctl="journalctl -p 3 -xb" # get journalctl error messages

alias gd="gcc -lstdc++ -Wall -Wextra -O0 -g -Ddebug"
alias g="gcc -lstdc++ -Wall -Wextra -O0 -g"

# download in  terminal
alias wget='wget -c'
alias dllist='wget -c -i list.txt'
alias aria2='aria2c -c -x8 -s8 -j1 --summary-interval=0 --file-allocation=none'
alias arialist='aria2c -c -x8 -s8 -j1 --summary-interval=0 -i list.txt --file-allocation=none'

# what if I mistyped clear?
alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'

# bye
alias :q='exit'
alias :Q='exit'
alias exiy='exit'
alias zzz="systemctl suspend"
alias zzzz="systemctl hibernate"
alias ظظظ="systemctl suspend"
alias ظظظظ="systemctl hibernate"
alias bye="command shutdown now"
alias sss='command shutdown now'
alias سسس='command shutdown now'
alias ssc='command shutdown -c'

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

# kubernetes aliases
alias k="kubectl"
alias kctx="kubectx"
alias kx="kubectx"

# clipboard in mac and linux
if command -v xsel &>/dev/null; then
  alias clipcopy="xsel -ib"
  alias clippaste="xclip -ob"
fi
alias clip_set="clipcopy"
alias clip_get="clippaste"

# command with external tools
alias neofetch="fastfetch"
alias j='jdate -u +"%Y/%m/%d"'
alias v='nvim'
alias c='nvim'
# make current folder ready for run junit tests
alias junit="cp -r  ~/pro*/*utils/junit_test_runner/* ."
alias redsh="redshift  -b 0.95:0.85  -l 35.74:51.33"
alias clock='tty-clock -s -S -c -t -C 6 -b' # open beautiful clock
alias qrcode="qrencode -t ansiutf8"
alias psrc="pyenv shell apps"
#alias yay="paru"
alias syu="paru -Syu" # If you know, you know.
alias kit="kitty --detach"
alias map="telnet mapscii.me"

# check network
alias ccc='curl -s ipconfig.io/country'
alias ccv='curl -s myip.wtf/yaml'
alias pccc='p ccc'
alias pccv='p ccv'
alias nw='watch -n 3 -t -d -b "curl -s ipconfig.io/json"'

# command with help of online resources
alias tb="nc mermbin.com 9999" # copy to online clipboard
alias sprung='curl -F "sprunge=<-" http://sprunge.us'
alias excuse="w3m http://developerexcuses.com/ | head -1"

alias pytohn="python"

# check the weather
wea() {
  local request="wttr.in/${1-tehran}?Fq"
  [ "$(tput cols)" -lt 125 ] && request+='n'
  curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}
alias wea1='curl -s "wttr.in/TEHRAN?format=3"' # one liner: how is the weather?
alias weac='curl -s "wttr.in/TEHRAN?F0"'       # current weather
alias weaf='curl -s "wttr.in/TEHRAN?Fq"'       # 3 day forecast

alias tllocalmgr="tlmgr --usermode"
alias tlmgr="tlmgr --usermode"

# open typora even if file does not exist
typ() {
  touch "$@"
  typora "$@"
}

# make with automatically finding the makefile
function make() {
  local dir original_dir
  original_dir=$(pwd)
  dir=$original_dir

  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/Makefile" ]]; then
      cd "$dir" || return 1
      command make "$@"
      local make_status=$?
      cd "$original_dir" || return 1
      return $make_status
    fi
    dir=$(dirname "$dir")
  done

  echo "No Makefile found in any parent directory." >&2
  return 1
}

# use gnu hightlight for add syntax hight to less
gat() {
  src-hilite-lesspipe.sh "$@" | less
}

dif() {
  if [ -x "$(command -v diff-so-fancy)" ]; then
    diff -u "$@" | diff-so-fancy
  else
    echo "git so fancy not installed, fallback"
    diff "$@"
  fi

}

function ls-() {
  local first_arg="-$1"
  shift
  command ls "$first_arg" "$@"
}

# cd and ls at same time
cls() {
  DIR="$*"
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME
  fi
  builtin cd "${DIR}" && ls
}

## network
alias neko="~/apps/nekoray/launcher"
alias p='http_proxy="http://127.0.0.1:6666/" https_proxy="http://127.0.0.1:6666/" '
if command -v proxychains4 &>/dev/null; then
  alias pc="nocorrect proxychains4 -q "
fi

query_proxy() {
  echo "http_proxy=$http_proxy, https_proxy=$https_proxy"
}

set_proxy() {
  export http_proxy="http://127.0.0.1:6666/"
  export https_proxy="http://127.0.0.1:6666/"
  query_proxy
}

reset_proxy() {
  export http_proxy=""
  export https_proxy=""
  export HTTP_PROXY=""
  export HTTPS_PROXY=""
  export ftp_proxy=""
  export ALL_PROXY=""
  query_proxy
}

alias rp="reset_proxy"
alias sp="set_proxy"
alias qp="query_proxy"

### other functions

# only high log levels
important() {
  grep -i -v "info" | grep -i -v "debug"
}

mnt() {
  mount | awk -F' ' '{ printf "%s\t%s\n",$1,$3; }' |
    column -t | grep -E "^/dev/" | sort
}

mem() {
  grep "Avail" /proc/meminfo |
    awk ' { print "Available Memory: " $2/1024/1024 " GB" }'
}

hdd() {
  df -x tmpfs -x devtmpfs |
    tail -n +2 |
    awk '{print $3, "of",$4, $5}' |
    sort -nr |
    uniq |
    numfmt --to=iec-i --from-unit=1024 --suffix=B --format="%.1f" --field=1,3 |
    head -10
}

last_commands() {
  history | awk '{print $4}' | sort | uniq -c | sort -n | tail -20
}

vlc_sub() {
  vlc -q ./*"$1"* --sub-file ./*"$1"*.srt
}

# sum of all videos in the current folder
sum_vid_len() {
  dir="$1"
  find "$dir" -maxdepth 1 -iname '*.*' -exec \
    ffprobe -v quiet -of csv=p=0 -show_entries format=duration {} \; |
    awk '{sum += $0} END{print sum/60 "min"}'
}

clean_docker() {
  # Kill all running containers:
  docker kill $(docker ps -q)

  # Delete all stopped containers
  docker rm $(docker ps -a -q)

  # clean unsued and dead images
  docker image prune -a

  # Delete all images
  docker rmi $(docker images -q)

  # Remove unused data
  docker system prune

  # And some more
  docker system prune -af

  docker volume rm $(docker volume ls -f dangling=true -q)

  docker system prune -af &&
    docker image prune -af &&
    docker system prune -af --volumes &&
    docker system df

  # and
  # service docker stop
  # cd /var/lib/docker
  # rm -rf *
  # service docker start
}

orphans() {
  if [[ -n $(\pacman -Qdt) ]]; then
    sudo \pacman -Rs $(\pacman -Qdtq)
  else
    echo "no orphans to remove"
  fi
}

clean_disk() {
  echo "cleaning paru"
  paru -Sc
  echo "cleaning pacman"
  sudo "pacman" -Scc
  echo "cleaning pip"
  \rm -r "$HOME/.cache/pip"
  echo "cleaning journalctl"
  sudo journalctl --vacuum-size=100M
  echo "cleaning recyclebin"
  sudo "rm" -rf "$HOME"/.local/share/Trash/files/* || true
  sudo "rm" -rf "$HOME"/.local/share/Trash/files/.* || true
  echo "cleaning go cache"
  go clean -cache -modcache
  echo "removing orphan packages"
  orphans
}

# # usage: ex <file>
ex() {
  if [ -f "$1" ]; then
    case $1 in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz) tar xzf "$1" ;;
    *.bz2) bunzip2 "$1" ;;
    *.rar) unrar x "$1" ;;
    *.gz) gunzip "$1" ;;
    *.tar) tar xf "$1" ;;
    *.tbz2) tar xjf "$1" ;;
    *.tgz) tar xzf "$1" ;;
    *.zip) unzip "$1" ;;
    *.Z) uncompress "$1" ;;
    *.7z) 7z x "$1" ;;
    *.deb) ar x "$1" ;;
    *.tar.xz) tar xf "$1" ;;
    *.tar.zst) unzstd "$1" ;;
    *) echo "'$1' cannot be extracted via ex()" ;;
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

##############
### FZF s ###
#############

fkill() {
  local pid

  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m --height=50% --layout=reverse | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m --height=50% --layout=reverse | awk '{print $2}')
  fi
  if [ "x$pid" != "x" ]; then
    echo "$pid" | xargs kill "-${1:-9}"
  fi
}

# select with fzf open file in gui
fo() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "${files[0]}" ]] && opener "${files[@]}"
}

# select with fzf open selected folder in file manager
fm() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  gui_opener "${files[@]}"
}

# open folder containing current playing track
fvlc() {
  files=$(lsof -p $(pidof -s vlc) | tail -1 | sed -nr 's#.*(/home.*$)#\1#p')
  gui_opener "${files[0]}"
}

# select with fzf open file with vim
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "${files[*]}" ]] && ${EDITOR:-vim} "${files[@]}"
}

# select dir and cd to it. including hidden directories
fzfd() {
  local dir
  dir=$(find "${1:-.}" -type d 2>/dev/null | fzf +m) && cd "$dir" || return
}

# search from history (fzf) to repeat
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

inst() {
  if hash paru paru 2>/dev/null; then
    paru -S --needed --noconfirm "$@"
  else
    pacman -S --needed --noconfirm "$@"
  fi
}

# search (fzf) and install package with paru
function in() {
  paru -Slq | fzf -q "$1" -m --preview 'paru -Si {1}' | xargs -ro paru -S
}

# search (fzf) and remove package with paru
re() {
  paru -Qq | fzf -q "$1" -m --preview 'paru -Qi {1}' | xargs -ro paru -Rns
}

lg() {
  export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

  lazygit "$@"

  if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
    cd "$(cat $LAZYGIT_NEW_DIR_FILE)" || return
    rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
  fi
}

port() {
  port_no="$1"
  case $port_no in
  '' | *[!0-9]*)
    echo "invalid port number"
    ;;
  *)
    sudo lsof -i ":${port_no}" -sTCP:LISTEN -n -P | awk '{ print $1 }' | tail +2 | sort | uniq
    ;;
  esac
}

wifi() {
  nmcli connection show --active | grep -i "wifi" --color=never
  ccc
}

wifiscan() {
  timeout 1s nmcli device wifi list --rescan yes >/dev/null
  nmcli device wifi list --rescan yes
}

__wificonnect() {
  echo "scanning for wifi networks"
  timeout 1s nmcli device wifi list --rescan yes || true
  #wifiscan
  if [ $# -eq 0 ]; then
    echo "No AP name supplied"
    return
  elif [ $# -eq 1 ]; then
    nmcli device wifi connect "$1" || return
  elif [ $# -eq 2 ]; then
    nmcli device wifi connect "$1" password "$2" || return
  fi
  echo "connected to:"
  nmcli connection show --active
  ccc
}
alias wificonnect=" __wificonnect"
alias wificonnect="__wificonnect"

#########
## ETC ##
#########

if [ -e "/Applications/MarkText.app/Contents/MacOS/MarkText" ]; then
  alias marktext="/Applications/MarkText.app/Contents/MacOS/MarkText"
fi

# exit-cd nnn with ctrl g
# open it with `n`
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
  # shellcheck disable=SC1091
  source "/usr/share/nnn/quitcd/quitcd.bash_sh_zsh"
  alias nnn="nnn -A"
  alias n="n -A"
fi
if [ -f /opt/homebrew/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
  # shellcheck disable=SC1091
  source "/opt/homebrew/share/nnn/quitcd/quitcd.bash_sh_zsh"
  alias nnn="nnn -A"
  alias n="n -A"
fi
