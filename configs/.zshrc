export GOPATH="$HOME/go"
export PATH="$PATH:\
$HOME/bin:\
$HOME/.local/bin:\
$GOPATH/bin"


export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh/"

# add brew site functions to FPATH
if type /opt/homebrew/bin/brew &>/dev/null; then
    FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

###############
##set zsh theme
###############
ZSH_THEME="archcraft-dwm"
ZSH_THEME="half-life"
ZSH_THEME="robbyrussell"
ZSH_THEME="random"

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
    # fish like syntax highlighting
    zsh-autosuggestions
    fast-syntax-highlighting

    # cool but slow autocomplete
    # https://github.com/marlonrichert/zsh-autocomplete
    #zsh-autocomplete

    copyfile #copy content of file to clipboard

    sudo # esc esc -> add sudo to command

    extract # extract any archive
    fzf     # fzf integrated to zsh

    golang # completion for go as well as aliases
    rust   # completion for rust, rustup, cargo
    stack  # completion for stack

    fancy-ctrl-z # enter ctrl-z instead of fg<enter>

    web-search # search web
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
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|sss)"

HISTSIZE=10000000
SAVEHIST=10000000


#setopt EXTENDED_HISTORY    # Write the history file in the ':start:elapsed;command' format.
setopt HIST_IGNORE_SPACE  # ignore history when command starts with space
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY         # Share history between all sessions.

alias jrnl=" jrnl"

#fix home/end/delete not working
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[A" up-line-or-beginning-search    # Arrow up
bindkey "^[[B" down-line-or-beginning-search  # Arrow down

export FZF_BASE=$(which fzf)
DISABLE_FZF_KEY_BINDINGS="false"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" --follow'
source <(fzf --zsh)

[[ -f ~/.aliases.sh ]] && . ~/.aliases.sh
[[ -f ~/.site.sh ]] && . ~/.site.sh

if [[ ! -e /tmp/welcome.sem ]]; then
    touch /tmp/welcome.sem
    cat "$HOME/proj/dotfiles/welcome.txt" || true
    # from here: https://www.asciiart.eu/space/astronauts
else
    if [ -x "$(command -v pfetch)" ]; then
        pfetch
    fi
fi

if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh --hook pwd --cmd z)"
fi

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if [ -x "$(command -v pyenv)" ]; then
    pyenv() {
        eval "$(command pyenv init -)"
        eval "$(command pyenv virtualenv-init -)"
        pyenv "$@"
    }
fi

(
type apt >/dev/null 2>&1 && [[ -f ~/.debian_config ]] && source ~/.debian_config
) || true 

