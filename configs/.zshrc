export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export PATH="$PATH:\
$HOME/bin:\
$HOME/.local/bin:\
$GOPATH/bin"
export GOPATH="$HOME/go"
export GRAVEYARD="$XDG_DATA_HOME/trash"

setopt NO_GLOB_COMPLETE
setopt autolist  # Display completion candidates immediately.
setopt listtypes # When listing files that are possible completions,
# indicate their types with a trailing character.
setopt nolistbeep # No bell on ambiguous completion!!
setopt interactivecomments # comments in interactive mode
setopt AUTO_CD

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# stamp shown in the history command output.
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

###########
## ZINIT ##
###########
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# My plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

zinit snippet OMZL::completion.zsh # omz autocomplete
zinit light marlonrichert/zsh-autocomplete  # ide-like autocomplete, only with omz-autocomplete
zstyle '*:compinit' arguments -D -i -u -C -w
zstyle ':autocomplete:*' min-input 3
zstyle ':autocomplete:*' delay 3  # seconds (float)

# My snippets
zinit snippet OMZ::plugins/colored-man-pages
zinit snippet OMZ::plugins/sudo # esc esc -> add sudo to command
zinit snippet OMZ::plugins/golang # completion for go as well as aliases
zinit snippet OMZ::plugins/fancy-ctrl-z # enter ctrl-z instead of fg<enter>


# Theme
zinit light agkozak/agkozak-zsh-prompt

# fix autosuggestion color to be visible
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

# solve slow paste issue (cause:zsh-autosuggestions)
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

export MANPATH="/usr/local/man:$MANPATH"

# Manually set language environment
export LANG=en_US.UTF-8
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
    export VISUAL='vim'
    export SUDO_EDITOR="vim"
else
    export EDITOR='nvim'
    export VISUAL='nvim'
    export SUDO_EDITOR="nvim"
fi


###########
# History #
###########

# ignore non meaningful commands from history
export HISTORY_IGNORE="(ls|cd|pwd|exit|reboot|history|sss)"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

#setopt EXTENDED_HISTORY    # Write the history file in the ':start:elapsed;command' format.
setopt HIST_IGNORE_SPACE    # ignore history when command starts with space
setopt HIST_IGNORE_DUPS     # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS    # do not save duplicated command
setopt HIST_REDUCE_BLANKS   # remove unnecessary blanks
setopt HIST_VERIFY          # Do not execute immediately upon history expansion.
setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when the shell exits.
#setopt SHARE_HISTORY       # Share history between all sessions.

#fix home/end/delete not working
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

################
# Autocomplete #
################

# Fzf autocomplete
export FZF_BASE=$(which fzf)
DISABLE_FZF_KEY_BINDINGS="false"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git" --follow'
source <(fzf --zsh)

# zoxide autocomplete
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init zsh --hook pwd --cmd x)"
fi

# initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if [ -x "$(command -v pyenv)" ]; then
    pyenv() {
        eval "$(command pyenv init -)"
        eval "$(command pyenv virtualenv-init -)"
        pyenv "$@"
    }
fi

# Brew autocomplete
if type /opt/homebrew/bin/brew &>/dev/null; then
    FPATH="$(/opt/homebrew/bin/brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# Git-extras autocomplete
if [[ -x "/usr/share/doc/git-extras/git-extras-completion.zsh" ]]; then
   source /usr/share/doc/git-extras/git-extras-completion.zsh
fi

autoload -Uz compinit && compinit -C
autoload -Uz bashcompinit && bashcompinit

zstyle ':completion:*' menu select

######################
# Source other files #
######################

if command -v apt >/dev/null 2>&1 && [[ -f ~/.debian_config ]]; then
    source ~/.debian_config
fi
[[ -f ~/.aliases.sh ]] && . ~/.aliases.sh
[[ -f ~/.site.sh ]] && . ~/.site.sh

if [[ ! -e /tmp/welcome.sem ]]; then
    touch /tmp/welcome.sem
    cat "$HOME/proj/dotfiles/welcome.txt" || true
    # from here: https://www.asciiart.eu/space/astronauts
else
    if [ -x "$(command -v pfetch)" ]; then
        true
        pfetch
    fi
fi
