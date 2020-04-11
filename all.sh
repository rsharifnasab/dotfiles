#!/usr/bin/env sh
echo "this will update all"


function neovim(){

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
    nvim -c "JCserverCompile"
    nvim -c "JCserverEnable"

    echo "installing ale from git"
    mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
    git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale
}

function fish(){
    echo "this will update fish functions"
    cp ./fish/config.fish ~/.config/fish/config.fish
    cp -r ./fish/functions ~/.config/fish/
}

