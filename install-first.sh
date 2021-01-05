#!/bin/bash

# required sofwares
echo "installing requierments"
yay -S --needed ghc-static cabal-install fd emacs python-pipenv python-pytest python-black python-pyflakes python-rednose python-pytest hlint shellcheck rtags fzf lsd neovim python-pylint-venv python-pynvim clang ctags the_silver_searcher fisher httpie astyle clang-format-static-bin autopep8 gofmt stylish-haskell js-beautify eslint tidy stylelint rustup rust-analyzer xsel

# setup rust toolchain
rustup install stable
rustup default stable
rustup component add clippy
rustup component add rustfmt
rustup component add rust-src
rustup component add rls

rustup toolchain add nightly
rustup component add rust-src
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
git clone https://github.com/lemnos/theme.sh || echo "cannot clone theme sh"

cd - || exit


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
