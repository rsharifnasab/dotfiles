" " " " " " " " " " "  " " "
"
"  _ ____   _(_)_ __ ___
" | '_ \ \ / / | '_ ` _ \
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|
"
" " " " " " " " " " "  " " "

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/configs.vim
source ~/.config/nvim/remaps.vim
source ~/.config/nvim/colors.vim
source ~/.config/nvim/functions.vim

for f in split(glob('~/,config/nvim/plug-config/*.vim'), '\n')
    exe 'source' f
endfor


