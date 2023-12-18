export GOPATH="$HOME/go"
export PATH="$PATH:\
$HOME/bin:\
$HOME/.local/bin:\
$GOPATH/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh/"

# add brew site functions to FPATH
if type /opt/homebrew/bin/brew &>/dev/null; then
    FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

###############
##set zsh theme
###############
ZSH_THEME="robbyrussell"
ZSH_THEME="random"
ZSH_THEME="archcraft-dwm"
ZSH_THEME="half-life"

ZSH_FAVLIST="$HOME/.zsh_favlist"
ZSH_THEME_RANDOM_CANDIDATES=()
for theme in $(cat $ZSH_FAVLIST); do
    ZSH_THEME_RANDOM_CANDIDATES+=($theme)
done

setopt NO_GLOB_COMPLETE
setopt autolist  # Display completion candidates immediately.
setopt listtypes # When listing files that are possible completions,
# indicate their types with a trailing character.
setopt nolistbeep # No bell on ambiguous completion!!

setopt interactivecomments # comments in interactive mode

DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true" # automatically update without prompting.
export UPDATE_ZSH_DAYS=13
# instead, update with omz update

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

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

    copyfile #copy content of file to clipboard

    sudo # esc esc -> add sudo to command

    extract # extract any archive
    fzf     # fzf integrated to zsh

    golang # completion for go as well as aliases
    rust   # completion for rust, rustup, cargo
    stack  # completion for stack

    z # most freq used dirs

    fancy-ctrl-z # enter ctrl-z instead of fg<enter>

    web-search # search web

    #zsh-vi-mode
)
source "$ZSH"/oh-my-zsh.sh

# fix autosuggestion color to bi visible
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

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
    export SUDO_EDITOR="vim"
else
    export EDITOR='nvim'
    export VISUAL='nvim'
    export SUDO_EDITOR="nvim"
fi

## Control history
# ignore non meaningful commands from history
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|cd -|cd ..|sss)"
# ignore history for jrnl
setopt HIST_IGNORE_SPACE
alias jrnl=" jrnl"

#fix home/end/delete not working
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

# reload new config files from dotfiles
# changes in sync_home will effect after second reload!
function r() {
    clear
    sync_home
    exec zsh || echo 'error in syncing'
}

export FZF_BASE=$(which fzf)
DISABLE_FZF_KEY_BINDINGS="false"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" --follow'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -f ~/.aliases.sh ]] && source ~/.aliases.sh

type apt >/dev/null 2>&1 && [[ -f ~/.debian_config ]] && source ~/.debian_config

if [[ -f "$HOME/.site.sh" ]]; then
    source "$HOME/.site.sh"
fi

if [[ ! -e /tmp/welcome.sem ]]; then
    touch /tmp/welcome.sem
    cat "$HOME/proj/dotfiles/welcome.txt" || true
    # from here: https://www.asciiart.eu/space/astronauts
else
    if [ -x "$(command -v pfetch)" ]; then
        pfetch
    fi
fi
