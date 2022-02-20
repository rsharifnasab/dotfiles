
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute(
    '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path
  )
end

vim.cmd [[
augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
augroup end
]]







packer = require("packer")




use = packer.use





packer.startup(function ()
    use 'wbthomason/packer.nvim'
    use 'wakatime/vim-wakatime' -- time track my programming

    -- Stable version of coc autocomplete
    use {
        'neoclide/coc.nvim',
        branch = 'release'
    }
    use 'github/copilot.vim'
    use 'dense-analysis/ale' -- ale for foreign linting


    -- ETC
    use 'editorconfig/editorconfig-vim'
    use 'airblade/vim-rooter'      -- set root based on .git
    use 'airblade/vim-gitgutter'   -- changed lines from HEAD
    use 'Yggdroot/indentLine'      -- draw a line to show tabs
    use 'Chiel92/vim-autoformat'   -- auto format code with :AutoFormat

    -- search
    use 'junegunn/fzf.vim'       -- fuzzy file finder (leader + tab)
    use {
        'junegunn/fzf',
        --{ 'dir': '~/.fzf', 'do': './install --bin' }
    }
    use  'mileszs/ack.vim'        -- search in project source code (leader + f)


    -- language specific
    use 'othree/html5.vim'               -- HTML5 omnicomplete and syntax
    --use 'peitalin/vim-jsx-typescript'  -- react JSX syntax highlighting for vim and Typescript
    use 'mrk21/yaml-vim'                 -- YAML syntax/indent plugin for Vim
    use 'ekalinin/Dockerfile.vim'        -- Vim syntax file & snippets for Docker's Dockerfile
    use 'pangloss/vim-javascript'        -- Vastly improved Javascript indentation and syntax support in Vim
    use 'rust-lang/rust.vim'             -- Vim configuration for Rust.

    -- better syntax highlight
    use 'justinmk/vim-syntax-extra'   -- add extra syntax highlight for flex
    use 'ap/vim-css-color'            -- Preview colours in source code while editing
    use 'uiiaoo/java-syntax.vim'      -- richer syntax hightligh for java
    use 'octol/vim-cpp-enhanced-highlight'  -- Additional Vim syntax highlighting for C++
    use {                             -- Semantic Highlighting for Python in Neovim
        'numirias/semshi',
        ft = 'python', 
        config = 'vim.cmd [[UpdateRemotePlugins]]'
    }
    use 'maxmellon/vim-jsx-pretty'     -- JSX and TSX syntax pretty highlighting for vim.
    -- use 'arzg/vim-rust-syntax-ext'  --  A Vim plugin that enhances Rust syntax highlighting


    -- snippets
    use 'SirVer/ultisnips'             -- snippet engine
    use 'honza/vim-snippets'           -- actually snippets

    -- file explorer
    use 'preservim/nerdtree'           -- file tree in the left side
    use 'jistr/vim-nerdtree-tabs'      -- NERDTree and tabs together in Vim, painlessly
    use 'ryanoasis/vim-devicons'       -- icons for nerdree and startify


    -- beautiful airline
    use 'vim-airline/vim-airline'      -- statusline
    use 'vim-airline/vim-airline-themes' --  themese for the statusline

    -- themes
    use 'rafi/awesome-vim-colorschemes' -- many colorshcemes

    -- language specific
    use {                              -- Go development plugin for Vim
        'fatih/vim-go'
        -- , { 'do': ':GoUpdateBinaries' }
    }
    --use 'elzr/vim-json'              -- A better JSON for Vim: highlighting of keywords/values, JSON-specific warnings, quote concealing.


end)





vim.g.coc_global_extensions = {
            'coc-html', 'coc-css',
            'coc-tsserver', 'coc-tslint-plugin',
            'coc-json', 'coc-yaml',
            'coc-rls', 'coc-rust-analyzer',
            'coc-pyright',
            'coc-java',
            'coc-clangd',
            'coc-lua',
            'coc-tag',
            -- coc-tag : add autocomplete source: tags file
            -- 'coc-snippets', 'coc-prettier',
}



