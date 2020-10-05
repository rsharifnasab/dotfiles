#!/bin/bash

# required sofwares
echo "installing requierments"
yay -S --needed ghc-static cabal-install fd emacs python-pipenv python-pytest python-black python-pyflakes python-rednose python-pytest hlint shellcheck rtags fzf lsd neovim python-pylint-venv python-pynvim clang ctags the_silver_searcher fisher httpie astyle

#emacs setup
echo "setupping emacs"
rm -r ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
./bootstrap.sh -f
#to updare:
~/.emacs.d/bin/doom upgrade
#add doom binary to path:
sudo ln -s ~/.emacs.d/bin/doom /usr/bin/doom



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

echo "install tir (time.ir in shell)"
mkdir -p ~/apps
cd ~/apps
git clone --depth 1 --branch 19.10.07 https://github.com/Pouriya-Jahanbakhsh/tir && cd tir
sudo make install 
