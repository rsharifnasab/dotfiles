"-----------------------------
"--
"--  _ ____   _(_)_ __ ___
"-- | '_ \ \ / / | '_ ` _ \
"-- | | | \ V /| | | | | | |
"-- |_| |_|\_/ |_|_| |_| |_|
"--
"-----------------------------


source ~/.config/nvim/configs.vim
luafile  ~/.config/nvim/packer.lua

for f in split(glob('~/.config/nvim/pluginconfig/*.vim'), '\n')
    exe 'source' f
endfor

source ~/.config/nvim/remaps.vim 
source ~/.config/nvim/functions.vim
source ~/.config/nvim/colors.vim
