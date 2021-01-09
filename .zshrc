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

alias r="source ~/pro*/dotfiles/.zshrc"
alias glog='git log --graph --oneline --decorate --abbrev-commit'
alias junit="cp -r ~/pro*/*utils/junit_test_runner/* ."
alias myip='time curl ifconfig.me'
alias clock='tty-clock -s -S -c -t -C 6 -b'
alias hdd='clear && df --all -h | grep  "/dev/sda*"'
alias mkdirp='mkdir -p'
alias n='watch -n 3 -t -d -b "curl -s ifconfig.me"'
alias rmi='rm -i'
alias sss='shutdown now'
alias ssc='shutdown -c'
alias wea='curl -s "wttr.in/TEHRAN"'
alias :q=exit
#alias fkill="FZF_DEFAULT_COMMAND='ps -ef'; kill $(fzf)"
function fkill(){
    FZF_DEFAULT_COMMAND='ps -ef'
    ps=$(fzf --bind 'ctrl-r:reload($FZF_DEFAULT_COMMAND)' \
      --header 'CTRL-R : reload' --header-lines=1 \
      --height=50% --layout=reverse)
    kill $(awk '{print $2}')
}

function typ(){
    if [ ! -f $@ ]; then
        touch "$@"
    fi
    typora "$@"
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

