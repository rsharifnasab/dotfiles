-----------------------------
--
--  _ ____   _(_)_ __ ___
-- | '_ \ \ / / | '_ ` _ \
-- | | | \ V /| | | | | | |
-- |_| |_|\_/ |_|_| |_| |_|
--
-----------------------------

--[[
require("configs/settings")
require("configs/remaps")
require("configs/colors")
--]]


require("plugins")
vim.cmd([[ source ~/.config/nvim/configs.vim ]])
vim.cmd([[ source ~/.config/nvim/remaps.vim ]])
vim.cmd([[ source ~/.config/nvim/colors.vim ]])
vim.cmd([[ source ~/.config/nvim/functions.vim ]])

vim.cmd([[
for f in split(glob('~/.config/nvim/plug-config/*.vim'), '\n')
    exe 'source' f
endfor
]])
