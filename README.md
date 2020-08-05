# Roozbeh dotfiles 
here i will share my important dot files 
im actually noob in writing dotfiles, if you want to help me, i appreciate


## emacs 
i'm using doom mode.
for install it: 
```bash
yay -S fd emacs 

rm -r ~/.emacs.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

#to updare:
~/.emacs.d/bin/doom upgrade
```

## vim

i used this [link](http://www.guillaume-barillot.com/2017/06/09/how-to-to-make-vim-to-look-like-atom/)
and a little change 



you need vim-plug, install it like this: 

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

to use it: copy `.vimrc` file to `~/.vimrc` 
and run vim and then: ':PlugInstall'



## neovim

`init.vim` was originally in `~/.config/nvim/init.vim`

you need vim-plug to isntall plugins 
install it like this:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

after copying, you can install plugins by `:PlugInstall` 
and clean them with `:PlugClean` # note that this will clean plugins which is deleted from init.vim




```bash
function neovim(){

    echo "installing vim plug with curl for neovim"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    echo "installing pynvim"
    pip3 install pynvim --user

    echo "install clang"
    sudo pacman -S clang

    echo "install ctags"
    sudo pacman -S ctags

    echo "install vimgrep engine"
    sudo pacman -S the_silver_searcher

    echo "install plugins for vim with :PlugIstall"
    nvim -c "PlugInstall"

    echo "compiling server of java"
    nvim -c "JCserverCompile"
    nvim -c "JCserverEnable"

    echo "installing ale from git"
    mkdir -p ~/.local/share/nvim/site/pack/git-plugins/start
    git clone --depth 1 https://github.com/dense-analysis/ale.git ~/.local/share/nvim/site/pack/git-plugins/start/ale
}
```


for using devicons, you should set terminal font to
ubuntu font



## fish

shell is my favorite shell (for now!)
it doesn't need much config 
but i have few functions and setting 
you can open fish setting with command: `fish_config`

location of dotfiles are in: `~/.config/fish/`

## fisher 
package manager for fish 
```bash 
yay -s fisher
fisher add halostatue/fish-fzf
```
fish-fzf is very cool thing! use FZF in shell 

### safe-rm
```bash 
   npm i -g safe-rm
```

```bash 
function fish(){
    echo "this will update fish functions"
    cp ./fish/config.fish ~/.config/fish/config.fish
    cp -r ./fish/functions ~/.config/fish/
}
```


## tir 

use time.ir in shell 

```bash 
mkdir -p ~/apps
cd ~/apps
git clone --depth 1 --branch 19.10.07 https://github.com/Pouriya-Jahanbakhsh/tir && cd tir
sudo make install 
```

## kateb
todo: use kateb fonts
https://github.com/kiamazi/kateb
