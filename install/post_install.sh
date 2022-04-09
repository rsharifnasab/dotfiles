#!/bin/bash
set -e
set -o nounset
set -o pipefail

function pre_install(){
    # update the system before anything!
    # install minimum tools to survive next steps!
    sudo pacman -Sy archlinux-keyring
    sudo pacman -Syu --needed base-devel gvim xsel xclip bat lsd
}


function aur_helper(){
    # if distro repo has paru, use it!
    sudo pacman -S paru || (
    # or else: install from source
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    )
}

# install a software with pacman
function inst(){
    paru -S --needed --noconfirm $*
}

function ta(){
    inst astyle splint firejail
    inst clang-format-static-bin
}

function terminal_bare(){
    inst zsh zsh-autosuggestions moreutils
    inst kitty ttf-fira-code 
}

function compilers(){
    inst nodejs npm go python3 python-pip \
        rustup jdk-openjdk lua
    rustup install stable
    rustup default stable
}

function neovim_bare(){
    inst neovim nvim-packer-git
    # requiered packages for neovim
    sudo pip3 install --upgrade msgpack pynvim
    sudo npm install -g neovim
    # sync plugins
    nvim +PackerSync
    nvim +PackerCompile
    nvim +UpdateRemotePlugins
}

function terminal_full(){
    inst tree tldr fd nnn source-highlight
    inst the_silver_searcher httpie
}

function shell_devel(){
    inst shellcheck-bin
}

function cpp_devel(){
    inst clang ctags cmake astyle
}


function js_devel(){
    # for js development
    inst js-beautify eslint tidy stylelint
}

function haskell_devel(){
    inst ghc-static stack cabal-install hlint stylish-haskell 
}

function rust_devel(){
    inst rust-analyzer
    rustup component add rls rust-analysis rust-src
    rustup component add clippy
    rustup component add rustfmt
}

function tirr(){
    mkdir -p ~/apps
    (
    cd ~/apps || exit
    echo "install tir (time.ir in shell)"
    git clone --depth 1  https://github.com/Pouriya-Jahanbakhsh/tir \
        && cd tir \
        && sudo make install \
        || echo "cannot install tir"
    )
}

function desktop_packages(){
    # gui apps                                 diff wallpaper
    inst firefox chromium vlc telegram-desktop meld variety
    # terminal apps     bluelight  htop   project stats  better wget
    inst nano jcal acpi redshift   btop   tokei          aria2
    #  encode data in qrcode             manage sizes  pic in terminal
    inst qrencode         pandoc           ncdu        viu
    #    markdown editor  screen recorder  gui editor for persian
    inst typora-free      obs-studio       xed # kate

    # prevent rm from deleting important files
    sudo npm i -g safe-rm
    # my lovely calculator
    pip3 install --user ipython

    #    gui http client
    inst insomnia-bin

    tirr
}


function zsh_full(){
    #install oh my zsh
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

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


function java_devel(){
    inst astyle
    # only of opened a java file
    # nvim +CocCommand java.updateLanguageServer

    sudo mkdir /usr/local/share/lombok
    sudo wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar
}


function python_devel(){
    mkdir -p ~/apps
    (
    cd apps || exit
    python -m venv venv
    source venv/bin/activate
    pip3 install --upgrade pip numpy pandas matplotlib pillow ipython
    )

    inst python-pylint python-black python-pyflakes

    #inst python-pylint-venv python-pipenv python-pytest \
    # python-rednose python-pytest autopep8
}


function micro(){
    # micro text editor
    curl https://getmic.ro | bash
}


function emacs(){
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


function ubuntu(){
    sudo apt install python-neovim python3-neovim \
        snapd cmake npm gcc g++ zsh-autosuggestions tldr \
        nnn fzf tree shellcheck xsel httpie clang ctags dnsutils

    # install recent version of this packages
    sudo snap install nvim --classic
    sudo snap install go --classic
}
# install goples
#go install golang.org/x/tools/gopls@latest
# install python language server
#pip install --user python-language-server

function bluetooth(){
    inst bluez bluez-tools
    sudo systemctl enable bluetooth.service
    sudo systemctl start bluetooth.service

}

function run(){
    pre_install
    aur_helper
    compilers
    terminal_bare
    neovim_bare
    zsh_full
    bluetooth
    desktop_packages
    ta
    cpp_devel
    java_devel
    python_devel
    #rust_devel
    #haskell_devel
    #js_devel
    #microredirection:
    #emacs
    #ubuntu
}

run


