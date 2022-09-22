export GOPATH="$HOME/go"

export PATH="$PATH:\
$HOME/bin:\
$HOME/.local/bin"

if [ -x "$(command -v go)" ]; then
    export PATH="$PATH:$(go env GOPATH)/bin"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh/"



###############
##set zsh theme
###############
ZSH_THEME="robbyrussell"
ZSH_THEME="half-life"
ZSH_THEME="random"
ZSH_THEME="archcraft-dwm"

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

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true" # automatically update without prompting.
export UPDATE_ZSH_DAYS=13

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
    fast-syntax-highlighting

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

[[ -f ~/.aliases.sh ]] && source ~/.aliases.sh

# platform specific configs
type apt >/dev/null 2>&1 && source ~/.debian_config || true


bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

# nice visualization
# pfetch
# colorscript -e 16

# ignore history for jrnl
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"


# reload new config files from dotfiles
# changes in sync_home will effect after second reload!
# TODO: handle this better
function r(){
    clear
    sync_home
    exec zsh || echo 'error in syncing'
}


if [[ ! -e /tmp/welcome.sem ]]
then
    touch /tmp/welcome.sem
    cat "$HOME/proj/dotfiles/welcome.txt" || true
    # from here: https://www.asciiart.eu/space/astronauts
fi

