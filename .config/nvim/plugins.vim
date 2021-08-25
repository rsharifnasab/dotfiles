
" " plugins " "
call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig-vim' " editorconfig


Plug 'ray-x/aurora'                  " beautiful theme
Plug 'rafi/awesome-vim-colorschemes' " many colorshcemes

Plug 'glepnir/dashboard-nvim' " dashboard

Plug 'airblade/vim-rooter'   " set root based on .git

" ale syntax check
"Plug 'dense-analysis/ale'
" deoplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
"Plug 'artur-shaik/vim-javacomplete2' "java for deoplete
"Plug 'shougo/deoplete-clangx' "c/cpp for deplete
"Plug 'deoplete-plugins/deoplete-jedi' " python for deoplete
"Plug 'sebastianmarkow/deoplete-rust' " rust for deoplete
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'} " go for deoplete


Plug 'neoclide/coc.nvim', {'branch': 'release'} " Stable version of coc


"machine learning autocomplete (ram problem)
"Plug 'codota/tabnine-vim'


Plug 'SirVer/ultisnips' " snipet engine
Plug 'honza/vim-snippets' " actually snippets


Plug 'justinmk/vim-syntax-extra' " add extra syntax highlight for flex
Plug 'Yggdroot/indentLine'       " some indent help
Plug 'Chiel92/vim-autoformat'    " auto format code with :AutoFormat

Plug 'preservim/nerdtree'        " file tree in the left side
Plug 'jistr/vim-nerdtree-tabs'   " NERDTree and tabs together in Vim, painlessly
Plug 'ryanoasis/vim-devicons'    " icons for nertree and startify

Plug 'vim-airline/vim-airline'        " statusline
Plug 'vim-airline/vim-airline-themes' "themese for statusline

Plug 'junegunn/fzf.vim'          "fuzzy file finder (leader + tab)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'mileszs/ack.vim' " vim grep : find in all project source codes (leader + f)

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }     " Go development plugin for Vim
Plug 'peitalin/vim-jsx-typescript'                     " react JSX syntax highlighting for vim and Typescript
Plug 'mrk21/yaml-vim'                                  " YAML syntax/indent plugin for Vim
Plug 'ekalinin/Dockerfile.vim'                         " Vim syntax file & snippets for Docker's Dockerfile
Plug 'elzr/vim-json'                                   " A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
Plug 'othree/html5.vim'                                " HTML5 omnicomplete and syntax
Plug 'pangloss/vim-javascript'                         " Vastly improved Javascript indentation and syntax support in Vim
Plug 'octol/vim-cpp-enhanced-highlight'                " Additional Vim syntax highlighting for C++
Plug 'ap/vim-css-color'                                " Preview colours in source code while editing
Plug 'arzg/vim-rust-syntax-ext'                        " A Vim plugin that enhances Rust syntax highlighting
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Semantic Highlighting for Python in Neovim
Plug 'maxmellon/vim-jsx-pretty'                        " JSX and TSX syntax pretty highlighting for vim.
Plug 'rust-lang/rust.vim'                              " Vim configuration for Rust.
call plug#end()



let g:coc_global_extensions = [
            \ 'coc-snippets', 'coc-prettier',
            \ 'coc-html', 'coc-css',
            \ 'coc-tsserver', 'coc-tslint-plugin', 'coc-angular',
            \ 'coc-json', 'coc-yaml',
            \ 'coc-rls', 'coc-rust-analyzer',
            \ 'coc-pyright',
            \ 'coc-java',
            \ ]

