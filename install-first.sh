#!/bin/bash

function install_package(){
    yay -S --needed --noconfirm "$*"
}

# required sofwares
echo "installing requierments"
yay -Syu
install_package base-devel gcc make cmake npm
install_package zsh zsh-autosuggestions moreutils
install_package bat tldr fd nnn fzf tree bind
install_package shellcheck rtags the_silver_searcher httpie xsel xclip
install_package clang ctags astyle clang-format-static-bin
install_package jdk-openjdk
install_package rustup rust-analyzer
install_package neovim 
install_package go gofmt
install-package python3 python-pylint-venv python-pipenv python-pytest \
    python-black python-pyflakes python-rednose python-pytest autopep8

isntall_package nodejs js-beautify eslint tidy stylelint
install_package ghc-static cabal-install hlint stylish-haskell emacs

install_package auto-xflux meld

# setup every thing for neovim 
sudo pip3 install --upgrade msgpack pynvim
sudo npm install -g neovim

# copy dotfiles to home folder
# dont create doom files
./bin/update

#install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install autosuggest for zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# install syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

#install zsh plugin : zsh-vi-mode
#git clone https://github.com/jeffreytse/zsh-vi-mode \
#  $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode

chsh -s "$(which zsh)"

#install fzf for zsh and other
~/.fzf/install

# setup rust toolchain
rustup install stable
rustup default stable

rustup component add rls rust-analysis rust-src
rustup component add clippy
rustup component add rustfmt

rustup toolchain add nightly
cargo +nightly install racer # auto complete engine for rust

mkdir -p ~/apps
(
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
)




## vim
# install vim plug
echo "downloading vimplug for vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install vim plugins
cp ./.vimrc ~/.vimrc
vim +PlugInstal


## neovim
# install vim plug for nvim
echo "downloading vimplug for neovim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall

# only of opened a java file
# nvim +CocCommand java.updateLanguageServer

sudo mkdir /usr/local/share/lombok
sudo wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar

#echo "compiling java language server"
#nvim +JCserverCompile
#nvim +JCserverStart

echo "downloading ale"
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale


echo "setup safe rm"
sudo npm i -g safe-rm

echo "installing micro"
curl https://getmic.ro | bash

#emacs setup
echo "setup emacs"
rm -r ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

#to updare:
~/.emacs.d/bin/doom upgrade
#add doom binary to path:
sudo ln -s ~/.emacs.d/bin/doom /usr/bin/doom


# copy dotfiles to home folder
# and create doom files
./bin/update -d


# ubuntu specific

sudo apt install python-neovim python3-neovim snapd cmake npm gcc g++ zsh-autosuggestions tldr nnn fzf tree shellcheck xsel httpie clang ctags dnsutils
sudo snap install nvim --classic
sudo snap install go --classic # newer than apt version

## tabnine stuff

(
    cd ~/.config/nvim/plugged || exit
    git clone --branch master --depth 1 https://github.com/codota/tabnine-vim
)
# install goples
GO111MODULE=on go get golang.org/x/tools/gopls@latest
pip install --user python-language-server

