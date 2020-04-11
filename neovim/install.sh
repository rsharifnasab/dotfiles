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

echo "compiling server of java"
nvim -c "JCserverCompiler"
nvim -c "JCserverEnable"


echo "installing ale from git"
mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale
