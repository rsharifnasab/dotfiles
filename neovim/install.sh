#!/usr/bin/env sh 



echo "installing vim plug with curl for neovim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "installing pynvim"
pip3 install pynvim --user

echo "install clang"
sudo pacman -S clang 


echo "install plugins for vim with :PlugIstall"
nvim -c "PlugInstall"

nvim -c "JCserverCompiler"
nvim -c "JCserverEnable"

