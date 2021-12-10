call plug#begin('~/.config/nvim/plugged')

" "  auto complete " "
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Stable version of coc
Plug 'github/copilot.vim' " github copilot
"Plug 'dense-analysis/ale' " ale syntax check


" " ETC " "
" Plug 'glepnir/dashboard-nvim'      " dashboard when nvim open without window
Plug 'editorconfig/editorconfig-vim' " editorconfig
Plug 'airblade/vim-rooter'           " set root based on .git
Plug 'airblade/vim-gitgutter'        " changed lines from HEAD
Plug 'Yggdroot/indentLine'           " draw a line to show tabs
Plug 'Chiel92/vim-autoformat'        " auto format code with :AutoFormat
Plug 'junegunn/fzf.vim'              " fuzzy file finder (leader + tab)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'mileszs/ack.vim'               " search in project source code (leader + f)

" " snippets " "
Plug 'SirVer/ultisnips' " snipet engine
Plug 'honza/vim-snippets' " actually snippets

" " file explorer " "
Plug 'preservim/nerdtree'        " file tree in the left side
Plug 'jistr/vim-nerdtree-tabs'   " NERDTree and tabs together in Vim, painlessly
Plug 'ryanoasis/vim-devicons'    " icons for nerdree and startify


" " beautiful airline " "
Plug 'vim-airline/vim-airline'        " statusline
Plug 'vim-airline/vim-airline-themes' " themese for the statusline

" " themes " "
Plug 'rafi/awesome-vim-colorschemes' " many colorshcemes

" " language specific " "
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }     " Go development plugin for Vim
" Plug 'elzr/vim-json'                                   " A better JSON for Vim: highlighting of keywords/values, JSON-specific warnings, quote concealing.
"Plug 'othree/html5.vim'                               " HTML5 omnicomplete and syntax
"Plug 'peitalin/vim-jsx-typescript'                    " react JSX syntax highlighting for vim and Typescript
"Plug 'mrk21/yaml-vim'                                 " YAML syntax/indent plugin for Vim
"Plug 'ekalinin/Dockerfile.vim'                        " Vim syntax file & snippets for Docker's Dockerfile
"Plug 'pangloss/vim-javascript'                        " Vastly improved Javascript indentation and syntax support in Vim
"Plug 'rust-lang/rust.vim'                             " Vim configuration for Rust.

" " better syntax highlight " '
Plug 'justinmk/vim-syntax-extra' " add extra syntax highlight for flex
Plug 'ap/vim-css-color'                                " Preview colours in source code while editing
Plug 'uiiaoo/java-syntax.vim' " richer syntax hightligh for java
Plug 'octol/vim-cpp-enhanced-highlight'                " Additional Vim syntax highlighting for C++
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Semantic Highlighting for Python in Neovim
"Plug 'maxmellon/vim-jsx-pretty'                        " JSX and TSX syntax pretty highlighting for vim.
"Plug 'arzg/vim-rust-syntax-ext'                        " A Vim plugin that enhances Rust syntax highlighting

call plug#end()


let g:coc_global_extensions = [
            \ 'coc-html', 'coc-css',
            \ 'coc-tsserver', 'coc-tslint-plugin',
            \ 'coc-json', 'coc-yaml',
            \ 'coc-rls', 'coc-rust-analyzer',
            \ 'coc-pyright',
            \ 'coc-java',
            \ 'coc-clangd',
            \ 'coc-lua',
            \ 'coc-tag', 
            \ ]
            " coc-tag : add autocomplete source: tags file
            " disabled :  'coc-snippets', 'coc-prettier',


