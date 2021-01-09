#!/bin/bash

function install_package(){
    yay -Syu --needed --noconfirm "$*"
}

# required sofwares
echo "installing requierments"
install_package base_devel gcc make
install_package zsh zsh-autosuggestions
install_package fd shellcheck rtags fzf the_silver_searcher httpie xsel
install_package clang ctags astyle clang-format-static-bin
install_package rustup rust-analyzer
install_package neovim python-pynvim
install_package go gofmt
install-package python3 python-pylint-venv python-pipenv python-pytest \
    python-black python-pyflakes python-rednose python-pytest autopep8

isntall_package nodejs js-beautify eslint tidy stylelint
install_package ghc-static cabal-install hlint stylish-haskell emacs


# copy dotfiles to home folder
./bootstrap.sh -f

#install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install autosuggest for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# install syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

chsh -s "$(which zsh)"

# setup rust toolchain
rustup install stable
rustup default stable
rustup component add clippy
rustup component add rustfmt
rustup component add rust-src
rustup component add rls

rustup toolchain add nightly
cargo +nightly install racer # auto complete engine for rust

mkdir -p ~/apps
cd ~/apps || exit

echo "clone rust source code"
git clone --depth=1 https://github.com/rust-lang/rust.git


echo "install tir (time.ir in shell)"
git clone --depth 1  https://github.com/Pouriya-Jahanbakhsh/tir \
    && cd tir \
    && sudo make install\
    && cd .. \
    || echo "cannot install tir"

echo "installing theme.sh"
#git clone https://github.com/lemnos/theme.sh || echo "cannot clone theme sh"
cd - || exit





## vim
# install vim plug
echo "downloading vimplug for vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugins
cp ./.vimrc ~/.vimrc
vim -c ':PlugInstal'


## neovim
# install vim plug for nvim
echo "downloading vimplug for neovim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim -c ":PlugInstall"

echo "compiling java language server"
nvim -c "JCserverCompile"
nvim -c "JCserverEnable"

echo "downloading ale"
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale


echo "setup fish fzf"
fisher add halostatue/fish-fzf

echo "setup safe rm"
npm i -g safe-rm



echo "installing micro"
curl https://getmic.ro | bash



#emacs setup
echo "setup emacs"
rm -r ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
./bootstrap.sh -f
#to updare:
~/.emacs.d/bin/doom upgrade
#add doom binary to path:
sudo ln -s ~/.emacs.d/bin/doom /usr/bin/doom
