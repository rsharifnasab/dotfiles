#!/usr/bin/bash

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
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Safer command for production
helm() {
    if [[ $1 == "uninstall" ]]; then
        release_name=$2
        current_namespace=$(oc project --short 2>/dev/null)

        if [[ $? -ne 0 ]]; then
            echo "guard: unable to get current project"
            return 1
        fi

        echo -n "guard: ☠️ destructive command detected, are you sure you want to uninstall '\e[1m\e[31m$release_name\e[0m' in '\e[1m\e[31m$current_namespace\e[0m'? (y/n): "
        read confirm

        if [[ $confirm != "y" ]]; then
            echo "Saved. :)"
            return 1
        fi
    fi
    command helm "$@"
}

# xdg-open handy aliases
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

# shorter/handy commands

alias rmr='rm -r'
alias cpr='cp -r'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grepi='grep --color=auto -i'
alias free="free -mht"

alias ls='ls -h -1 --color=auto'
alias l='ls -h -1 --color=auto -lAh'
alias la='ls -h -1 --color=auto -lAh'
alias ll='ls -h -1 --color=auto -lAh'
alias l.="ls -A | egrep '^\.'"
alias sl='ls'

if command -v lsd &>/dev/null; then
    alias ls='lsd    -Fh1    --color=auto            --git --group-dirs first'
    alias lsize='lsd -Fh1l   --color=auto --sizesort --git                    --total-size'
    alias l='lsd     -Fh1lA  --color=auto --sizesort --git --group-dirs first'
    alias tree='lsd  -Fh1    --color=auto            --git --group-dirs first --tree'
fi

# emacs client, needs emacs session running
alias em-term='emacsclient -a ""'
alias em='emacsclient -n -c -a ""'

alias please="sudo "
alias cd..='cd ..'
alias mkdir="mkdir -pv"
alias cpv='rsync -ah --info=progress2' # copy with progressbar
mkcd() { mkdir -p "$@" && eval cd "\"\$$#\""; }
dns() { dig "$@" "+short"; }

alias pacman="sudo pacman --color auto"
alias jctl="journalctl -p 3 -xb" # get journalctl error messages

alias gd="gcc -lstdc++ -Wall -Wextra -O0 -g -Ddebug"
alias g="gcc -lstdc++ -Wall -Wextra -O0 -g"

alias ag="ag --hidden --ignore .git"

alias dim="echo $(tput cols)x$(tput lines)"

alias wget='wget -c'
alias dllist='wget -c -i list.txt'
alias aria2='aria2c -c -x8 -s8 -j1 --summary-interval=0 --file-allocation=none'
alias arialist='aria2c -c -x8 -s8 -j1 --summary-interval=0 -i list.txt --file-allocation=none'

# what if I had typo in clear?
alias clean='clear'
alias CLEAN='clear'
alias CLEAR='clear'
alias زمثشق='clear'

# bye
alias :q='exit'
alias :Q='exit'
alias :wq='exit'
alias exiy='exit'
alias quit='exit'
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
alias gt='git'
alias fir='git'
alias glog='git log --graph --oneline --decorate --abbrev-commit --all'
alias gstat="git status -sb"
alias gstatv="git status -vv"
alias stat="git status -sb"
alias statv="git status -vv"
alias gadd="git add"
alias gcom="git commit -m"
alias gcome="git commit" # open editor!
alias gpush="git push"
alias gpull="git pull"
alias gdiff="git diff HEAD --color-words"
alias gfetch="git fetch --all --prune"
alias gloc="git ls-files | xargs wc -l"
alias gclon="git clone --depth 1 --branch "
alias igt="git"

# go aliases
alias go="nocorrect go"
alias gor="go run"
alias gob="go build ."
alias goc="go clean"
alias gott="go test './...' -cover"
alias gop='cd $GOPATH'
alias ggu="go get -v -u './...' && go mod tidy"
gch() {
    go mod tidy
    go mod vendor
    go build -o /dev/null './...'
    go test './...' -count=0
}
format_go() {
    gofmt -w .
    gci write . --skip-generated -s standard -s default
    gofumpt -w .
}

# kubernetes aliases
alias k="kubectl"
alias kctx="kubectx"
alias kx="kubectx"
alias oci="kubectx -c"

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorx='sudo reflector --age 6 --latest 20 --fastest 20 \
    --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'

# clipboard in mac and linux
if command -v xsel &>/dev/null; then
    alias clipcopy="xsel -ib"
    alias clippaste="xclip -ob"

    alias pbpaste='xclip -selection clipboard -o'
fi
alias clip_set="clipcopy"
alias clip_get="clippaste"

# command with external tools
alias neofetch="fastfetch"
alias j='jdate -u +"%Y/%m/%d"'
alias c='nvim'
alias b='nvim'
alias clock='tty-clock -s -S -c -t -C 6 -b' # open beautiful clock
alias qrcode="qrencode -t ansiutf8"
alias syu="paru -Syu"
alias kit="kitty --detach"
alias map="telnet mapscii.me"
alias pytohn="python"
alias sudounlock="faillock --user roozbeh --reset"

# make current folder ready for run junit tests
alias junit="cp -r  ~/pro*/*utils/junit_test_runner/* ."

# check network
alias ccc='timeout 7s curl -s https://api.ipapi.is'   # json info
alias ccv='timeout 7s curl -s https://myip.wtf/yaml'  # everything
alias ccb='timeout 7s curl -s https://ident.me; echo' # ip
alias pccc='(sp; ccc)'
alias pccv='(sp; ccv)'
alias pccb='(sp; ccb)'
alias nw='watch -n 3 -t -d -b "curl -si ident.me"'
alias snw='watch -n 3 -t -d -b "curl -si soft98.ir"'

# Latex
alias tllocalmgr="tlmgr --usermode"
alias tlmgr="tlmgr --usermode"

# Clock
alias tehran='TZ="Asia/Tehran" date'
alias calgary='TZ="America/Edmonton" date'
alias toronto='TZ="America/Toronto" date'

# ai
dict() {
    mods -m haiko "translate this text from english to persian (or persian to english it it's already english). do it without any further explanaition, only give me 1 to 3 meanings: $1"
}
alias commit_message='git diff --staged | mods "Generate a conventional git commit message, for my changes, no other output"'

# use e1 - e100 to edit files
tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }
alias init_zoxide_here='find . -maxdepth 2 -type d -exec zoxide add {} \;'
alias power="cat /sys/firmware/acpi/platform_profile"
alias autin="atuin"
alias code=codium

epoch() { date -d "@$1" '+%Y-%m-%d %H:%M:%S'; }

# command with help of online resources
alias tb="nc mermbin.com 9999" # copy to online clipboard
alias excuse="w3m http://developerexcuses.com/ | head -1"

# check the weather
wea() {
    local city="${1:-tehran}"
    local request="wttr.in/${city}?Fq"
    [ "$(tput cols)" -lt 125 ] && request+='n'
    curl -H "Accept-Language: ${LANG%_*}" --compressed "$request"
}

wea1() {
    local city="${1:-tehran}"
    curl -s "wttr.in/${city}?format=3"
}

weac() {
    local city="${1:-tehran}"
    curl -s "wttr.in/${city}?F0"
}

# 3 day forecast
weaf() {
    local city="${1:-tehran}"
    curl -s "wttr.in/${city}?Fq"
}

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

# use gnu highlight for add syntax highlight to less
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

query_proxy() {
    echo "http_proxy=$http_proxy, https_proxy=$https_proxy"
}

set_socks_proxy() {
    export http_proxy="socks5h://127.0.0.1:2333/"
    export https_proxy="socks5h://127.0.0.1:2333/"

    query_proxy
}

set_http_proxy() {
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

alias ssp="set_socks_proxy"
alias shp="set_http_proxy"
alias rp="reset_proxy"
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

# Docker

alias docker-compose='sudo docker-compose'
alias docker='sudo docker'
alias dockerd='sudo dockerd'
clean_docker() {
    # Kill all running containers:
    docker kill $(docker ps -q)

    # Delete all stopped containers
    docker rm $(docker ps -a -q)

    # clean unsued and dead images
    docker image prune -a

    # Delete all images
    docker rmi $(docker images -q)

    docker volume rm $(docker volume ls -f dangling=true -q)

    docker network prune --force

    docker system prune -af &&
        docker builder prune &&
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
    "rm" -rf "$HOME"/.local/share/trash || true
    "rm" -rf "$HOME"/.local/share/Trash/files/* || true
    "rm" -rf "$HOME"/.local/share/Trash/files/.* || true

    echo "cleaning go cache"
    go clean -cache -modcache -testcache

    echo "removing orphan packages"
    orphans
}

bookkeep_zsh() {
    zinit delete --clean --yes
    zinit self-update
    zinit update --all
}

bookkeep_nvim() {
    touch /tmp/a.txt

    # mason for external services
    nvim /tmp/a.txt +MasonToolsUpdateSync +q

    # Lazy for plugins
    nvim -c 'autocmd User VeryLazy Lazy sync'
}

bookkeep() {
    paru
    bookkeep_zsh
    clean_disk
    bookkeep_nvim
}

v() {
    local file line col

    # filename:line:col
    if [[ "$1" =~ ^([^:]+):([0-9]+):([0-9]+)$ ]]; then
        if [ -n "${BASH_VERSION:-}" ]; then
            file=${BASH_REMATCH[1]}
            line=${BASH_REMATCH[2]}
            col=${BASH_REMATCH[3]}
        else
            file=${match[1]}
            line=${match[2]}
            col=${match[3]}
        fi
        nvim +"call cursor($line, $col)" "$file"

    # filename:line
    elif [[ "$1" =~ ^([^:]+):([0-9]+)$ ]]; then
        if [ -n "${BASH_VERSION:-}" ]; then
            file=${BASH_REMATCH[1]}
            line=${BASH_REMATCH[2]}
        else
            file=${match[1]}
            line=${match[2]}
        fi
        nvim +"$line" "$file"

    # normal case
    else
        nvim "$@"
    fi
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
    if [ "$pid" != "" ]; then
        echo "$pid" | xargs kill "-${1:-9}"
    fi
}

# select with fzf open file in gui
fo() {
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "${files[@]}" ]] && opener "${files[@]}"
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
# same as ctrl-r
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

# change git branch with fzf
fbr() {
    local branches branch
    branches=$(git branch)
    branch=$(echo "$branches" | fzf +m)
    git switch $(echo "$branch" | sed 's/^[* ]*//')
}

# change git branch with fzf, including remote
fbrr() {
    local branches branch
    branches=$(git branch --all)
    branch=$(echo "$branches" | fzf +m)
    git switch $(echo "$branch" | sed 's/^[* ]*//')
}

#### OTHER #######

lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
    lazygit "$@"
    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)" || return
        rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
    fi
}

### NETWORK ###

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
    timeout 5s nmcli device wifi list --rescan yes >/dev/null
    nmcli device wifi list --rescan yes
}

__wificonnect() {
    echo "scanning for wifi networks"
    timeout 5s nmcli device wifi list --rescan yes || true

    if [ $# -eq 0 ]; then
        echo "No AP name supplied"
        return
    elif [ $# -eq 1 ]; then
        echo "connecting to $1"
        nmcli device wifi connect "$1" --ask || return
    elif [ $# -eq 2 ]; then
        echo "connecting to $1 with password"
        nmcli device wifi connect "$1" password "$2" || return
    fi
    echo "connected to:"
    nmcli connection show --active
    ccc
}
alias wificonnect="__wificonnect"

wl() {
    local ssid
    local conn

    nmcli device wifi rescan >/dev/null
    ssid=$(nmcli device wifi list | tail -n +2 | grep -v '^  *\B--\B' | fzf -m | sed 's/^ *\*//' | awk '{print $1}')

    if [ "$ssid" != "" ]; then
        # check if the SSID has already a connection setup
        conn=$(nmcli con | grep "$ssid" | awk '{print $1}' | uniq)
        if [ "$conn" = "$ssid" ]; then
            echo "Please wait while switching to known network $ssid…"
            # if yes, bring up that connection
            nmcli con up id "$conn"
        else
            echo "Please wait while connecting to new network $ssid…"
            # if not connect to it and ask for the password
            nmcli device wifi connect "$ssid"
        fi
    fi

    echo "connected to:"
    nmcli connection show --active
    ccc
}

#########
## ETC ##
#########

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

# cd with yazi
y() {
    # Store the current directory to return to in case of failure
    local original_dir
    local cwd_path
    local target_dir

    original_dir="$PWD"
    cwd_path="/tmp/cwd_path_yazi"

    # Run yazi with the cwd file option
    yazi --cwd-file "$cwd_path"

    # Check if the cwd file exists and is readable
    if [[ -r "$cwd_path" ]]; then
        target_dir="$(cat "$cwd_path")"

        # Check if the target directory exists and is accessible
        if [[ -d "$target_dir" && -x "$target_dir" ]]; then
            cd "$target_dir" || return 1
            echo "Changed directory to: $target_dir"
        else
            echo "Error: Target directory is invalid or inaccessible" >&2
            cd "$original_dir" || exit
            return 1
        fi
    else
        echo "Error: Could not read the Yazi cwd file, have you installed yazi?" >&2
        return 1
    fi
}

hash_dir() {
    if [ -z "$1" ]; then
        echo "Usage: hash_dir <directory>"
        return 1
    fi
    tar -cf - "$1" | sha256sum
}

# Source local envs
set_envs() {
    [[ -f "$HOME/.envs.site.sh" ]] && . "$HOME/.envs.site.sh"
}

_run_with_envs() {
    (
        set_envs
        "$@"
    )
}

alias s="_run_with_envs "

function gemini() {
    (
        set_http_proxy
        npx https://github.com/google-gemini/gemini-cli
    )
}

function claude() {
    (
        set_http_proxy
        claude
    )
}

zed() {
    (
        set_envs
        set_http_proxy
        export OPENAI_BASE_URL=
        if command -v zeditor &>/dev/null; then
            command zeditor "$@"
        elif command -v zed &>/dev/null; then
            command zed "$@"
        else
            echo "zed not found"
            exit 1
        fi
    )
}
alias z="zed"

opencode() {
    (
        set_envs
        set_http_proxy
        export OPENAI_BASE_URL=
        command opencode
    )
}

fabric() {
    (
        set_envs
        set_http_proxy
        export OPENAI_BASE_URL=
        export OPENAI_API_KEY=
        command fabric
    )
}
