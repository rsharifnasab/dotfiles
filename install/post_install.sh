#!/bin/bash
set -e
set -o nounset
set -o pipefail

function pre_install() {
    # update the system before anything!
    # install minimum tools to survive next steps!
    sudo pacman -Sy  --noconfirm archlinux-keyring
    sudo pacman -Syu
    sudo pacman -S --needed --noconfirm base-devel gvim xsel xclip wget curl \
        stow man-pages man lsof bc rsync
}

function inst() {
    if hash paru paru 2>/dev/null; then
        paru -S --needed --noconfirm $*
    else
        pacman -S --needed --noconfirm $*
    fi
}
function aur_helper() {
    # if distro repo has paru, use it!
    sudo pacman -S paru || (
        # or else: install from source
        sudo pacman -Syu --needed rustup
        rustup install stable
        rustup default stable

        cd /tmp
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si
    )
}

function ta() {
    inst astyle splint firejail \
        clang-format-static-bin
}

function compilers() {
    inst nodejs npm go python3 python-pip \
        rustup jdk-openjdk lua elixir
    rustup install stable
    rustup default stable
}

function neovim_full() {
    inst neovim

    # nvim packer
    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
		~/.local/share/nvim/site/pack/packer/start/packer.nvim

    # requiered packages for neovim
    pip3 install --user --upgrade msgpack pynvim
    sudo npm install -g neovim
    # sync plugins
    nvim +PackerSync
    nvim +UpdateRemotePlugins
    nvim +CocUpdate
}

function terminal_full() {
    inst zsh moreutils \
		kitty ttf-fira-code \
        tree tldr fd nnn source-highlight \
		the_silver_searcher httpie
}

function shell_devel() {
    go install mvdan.cc/sh/v3/cmd/shfmt@latest
    inst shellcheck-bin
}

function cpp_devel() {
    inst clang ctags cmake astyle
}

function js_devel() {
    # for js development
    inst eslint tidy stylelint
    sudo npm -g install js-beautify
}

function haskell_devel() {
    inst ghc-static stack cabal-install hlint stylish-haskell
}

function rust_devel() {
    inst rust-analyzer
    rustup component add rust-analysis rust-src
    rustup component add clippy
    rustup component add rustfmt
}

function text_linters() {
    #    grammer check offline but slow
    inst languagetool

    # fast and have options
    #inst vale
    #vale sync
    # read and sync styles from .vale.ini
    # more info: https://vale.sh/generator/

    # fast, foxus on non-offending writing
    #sudo npm install alex --global
}

function virtualbox() {
    inst virtualbox virtualbox-host-modules-arch  virtualbox-guest-iso  virtualbox-ext-oracle
}

function desktop_packages() {
    # make persian fonts ok
    pacman -S --needed noto-fonts noto-fonts-emoji ttf-linux-libertine ttf-dejavu
    # multi monitor management
    inst lxrandr
    # gui apps                                 diff wallpaper
    # terminal apps     bluelight  htop   project stats  better wget
    #  encode data in qrcode manage sizes  pic in terminal
    #    markdown editor  screen recorder  gui editor for persian
    #    gui http client    beautiful ncurses clock
    inst firefox chromium vlc telegram-desktop meld variety \
        nano jcal acpi redshift btop tokei aria2 \
        qrencode pandoc-bin ncdu viu \
        typora-free obs-studio xed \
        gnome-screenshot insomnia-bin tty-clock \
        zip unzip unrar xarchiver \
        thunar dnsutils inetutils \
        pacman-contrib flameshot \
        ntfs-3g engrampa

    # tmux - ncdu - bandwith which
    inst zellij diskonaut bandwhich


    # prevent rm from deleting important files
    sudo npm i -g safe-rm

    # my lovely calculator and speedtest
    pip3 install --user ipython speedtest-cli

    # install persian font (from here: https://github.com/fzerorubigd/persian-fonts-linux)
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/fzerorubigd/persian-fonts-linux/master/farsifonts.sh)"

}

function zsh_full() {
    #install oh my zsh
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

	# archcraft zsh theme
    (
        cd ~/.oh-my-zsh/themes || exit
        git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/
        mv ZshTheme-ArchCraft/archcraft-dwm.zsh-theme "$PWD"
    )


    # autosuggestion, fast syntax highlight, autocomplete
    git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions \
        ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone --depth 1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
        ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting
    git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git \
        ~/.oh-my-zsh/custom/plugins/zsh-autocomplete

    #install zsh plugin : zsh-vi-mode
    #git clone https://github.com/jeffreytse/zsh-vi-mode \
    #  $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

    chsh -s "$(which zsh)"

    #install fzf for zsh and other
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

function java_devel() {
    inst astyle
    # only of opened a java file
    # nvim +CocCommand java.updateLanguageServer

    sudo mkdir /usr/local/share/lombok
    sudo wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar
}

function python_devel() {
    mkdir -p ~/apps
    (
        cd apps || exit
        python -m venv venv
        source "venv/bin/activate"
        pip3 install --upgrade pip pylint pynvim ipython
        pip3 install --upgrade numpy pandas matplotlib plotly networkx pillow

        pip3 install mypy pandas-stubs data-science-types # python static type check (work with ale)
        #mypy --install-types
    )

    inst python-pylint python-black pyright autopep8 pynvim

    #inst python-pylint-venv python-pipenv python-pytest \
    # python-rednose python-pytest autopep8

    # install python language server
    #pip install --user python-language-server

}

function micro() {
    # micro text editor
    curl https://getmic.ro | bash
}

function emacs() {
    inst emacs
    rm -r ~/.emacs.d
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install

    #to updare:
    ~/.emacs.d/bin/doom upgrade
    #add doom binary to path:
    sudo ln -s ~/.emacs.d/bin/doom /usr/bin/doom

    # copy dotfiles to home folder
    ./bin/update -d
}

function ubuntu() {
    sudo apt install python-neovim python3-neovim \
        snapd cmake npm gcc g++ zsh-autosuggestions tldr \
        nnn fzf tree shellcheck xsel httpie clang ctags dnsutils

    # install recent version of this packages
    sudo snap install nvim --classic
    sudo snap install go --classic
}

function bluetooth() {
    inst bluez bluez-tools
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service
    rfkill unblock all
}

function list() {
    declare -F | awk '{print $NF}' | sort | egrep -v "^_" 
}

function run() {
    pre_install
    aur_helper
    compilers
    neovim_full
    zsh_full
    bluetooth
    desktop_packages
    ta
    cpp_devel
    java_devel
    rust_devel
    python_devel
    #text_linters
    #haskell_devel
    #js_devel
    #micro
    #emacs
    #ubuntu
}

run
