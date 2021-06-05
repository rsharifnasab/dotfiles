" " " " " " " " " " "  " " "
"
"  _ ____   _(_)_ __ ___
" | '_ \ \ / / | '_ ` _ \
" | | | \ V /| | | | | | |
" |_| |_|\_/ |_|_| |_| |_|
"
" " " " " " " " " " "  " " "
" improvement:
"  give coc and youcompleteme a chance


set nocompatible " don't need to be compatible with VI

set number " enable numbering of lines
set norelativenumber " not absolute line number
set termguicolors " enable true colors support
syntax enable " enable syntax highlighting
set showmatch " highlight matching bracket
set showcmd " display incomplete commands
set showmode " show current mode of editor
set laststatus=2 " last 2 line : show status
"set cursorline " highlight current cursor line
set t_Co=256 " 256 color terminal

set wrap " break the text to fill in terminal width
set linebreak " break lines on space, rather than last char
set breakindent " if broke the line, indent the broken part

set mouse=a " use mouse normally
set clipboard+=unnamedplus "sync vim clipboard with system clipboard
set lazyredraw " don't redraw screen in macros
set synmaxcol=200 "200 char of line should be highlited
"set virtualedit=all " move cursor freely in insert mode

set wildmenu " autocomplete vim commands wuth tab
set wildmode=list:longest
set whichwrap+=<,>,[,] " < and > can change line
set backspace=indent,eol,start " Fix backspace behavior
set list listchars=tab:\ \ ,trail:· " Highlight tailing whitespace
set path+=** " search file with :find (same as FZF)

command Spellcheck setlocal spell spelllang=en_us " spell check with "SpellCheck"

" " fold " "
set foldmethod=indent
set foldnestmax=10
set nofoldenable " no fold first time
set foldlevel=5 " close fold auto after how many indents

" " tab " "
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set nocindent

" " search " "
set hlsearch " highlight search result!
set ignorecase " search in case insensitive mode
set smartcase " case sensitive if we have uppercase in query
set incsearch " search while typing
set gdefault " global find and replace by default


" " file " "
" set autochdir " automatically cd to current dir
set noautochdir " do not cd to current folder
set autoread " auto reload file changed outside
set autowriteall " auto write all files before make

filetype on " file-type-base config
filetype indent on
filetype plugin on
set encoding=utf-8

set nobackup " do not create extra junk files
set nowritebackup
set noswapfile


" disable bell
set noerrorbells visualbell t_vb=


let mapleader="\<Space>" "set the leader key
let g:python3_host_prog = '/usr/bin/python3' " set python path (make sure it work inside venvs

let g:deoplete#sources#go#gocode_binary = "~/go/bin/gocode"

set hidden " keep undo history on buffer change


" " airline colorscheme " "
"let g:airline_theme='dark' " good, colorful
"let g:airline_theme='lucios'
"let g:airline_theme='minmalist' " just grey
"let g:airline_theme='bubblegum' " candy
let g:airline_theme='serene' " classic beautiful
"let g:airline_theme='random'



" " color scheme " "
set background=dark

" default beautiful
"colorscheme ron
"colorscheme peachpuff
"colorscheme evening
"colorscheme zellner "good light mode

" added
"colorscheme angr
"colorscheme gotham          " deep blue
"colorscheme afterglow       " brown
"colorscheme rdark-terminal2 " again brown
"colorscheme dogrun          " like atom, low contrast
"colorscheme spacecamp       " like spacemacs, grey
"colorscheme elflord         " like sublime
"colorscheme lucid           " black with beautiful red color
"colorscheme papercolor      " great, candy colors
colorscheme molokai          " great, deep balck and good colors





" save and jump to last position in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" save undo stack in file, available after reopen file
if has('persistent_undo')
    set undofile
    silent !mkdir -p /tmp/vimundo
    set undodir=/tmp/vimundo
endif


" " general remaps " "
map <C-a> <esc>ggVG<CR> " ctrl a -> Select all

noremap  <silent> <C-S>      :update<CR> " control S -> save
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
nnoremap <silent> <C-L>  :nohlsearch<CR>h<C-L> 
" ctrl L -> clear highlighted search result
tnoremap <Esc> <C-\><C-n> " esc in terminal mode -> exit


" " tabs " "
nnoremap <C-p> :bnext<CR>
nnoremap <C-o> :bprevious<CR>
nmap <C-n> :enew<cr>
noremap <silent> <C-q> :bd<CR> " Close current buffer


" Go to normal mode with <jk> (esc is too far)
inoremap jk <esc>
vnoremap jk <esc>
inoremap kj <esc>
vnoremap kj <esc>

" fix :WQ problem
nnoremap ; :
vnoremap ; :
command Wq wq
command WQ wq
command W w
command X x
command Q x


" " map most frequent actions with leader

" open new file
nnoremap <Leader>o :CtrlP<CR> 

" save and close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>

" copy paste with space
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" visual line mode
nmap <Leader><Leader> V


function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <F2> :call NumberToggle()<cr> " toggle relative number



" " ctags " "
command! MakeTags !ctags -R .
"create tags file

" " ack (global in file search) " "
" change vim global file search with ack engine:
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" " fzf " "
nmap <leader><tab> :FZF<CR>

" " nerd tree " "
noremap <C-f> :NERDTreeToggle<CR> " toggle nerd tree  with ctrl n
let NERDTreeIgnore=['\.pyc$','\.class','\~$','\.out'] " ignore files from nerdtree


" " deoplete " "
" autocomplete menu color
highlight Pmenu ctermbg=6 guibg=#f1f1f0
highlight PmenuSel ctermbg=3 guifg=#d5dd00 guibg=#1f82cd
"highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" deoplete for java
autocmd FileType java setlocal omnifunc=javacomplete#Complete " enable autocomplete in startup
let g:deoplete#enable_at_startup = 1
let g:JavaComplete_CheckServerVersionAtStartup = 0
let g:JavaComplete_EnableDefaultMappings = 0



" " Airline (status line) " "
"let g:airline_extensions = [] "clear all extensions
let g:airline#extensions#whitespace#enabled = 0 "dont show ugly wihtespaces"

let g:airline_powerline_fonts=1

" " tabline setting " "
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1 "show buffers in tabline"
let g:airline#extensions#tabline#fnamemod= ':t' "just show filename"



" " Indent line " "
let g:indentLine_enabled=1
let g:indentLine_color_term=230
let g:indentLine_char='|'
"let g:indentLine_char_list = [' ','|', '¦', '┆', '┊']


" " ale " "
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_list_window_size = 5
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1 " enable integration with airline.

" custom syntax highlight

au BufRead,BufNewFile *.fdl set filetype=gezel " gezel.vim in ./syntax


" " AUTO FORMATER " "
" au BufWrite * :Autoformat " set auto format on save
" let g:autoformat_verbosemode=1 " to enable debug mode


" " vim-go " "
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1

let g:go_fmt_command = 'goimports'


autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4


" " rust " "
let g:deoplete#sources#rust#racer_binary='/home/roozbeh/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/roozbeh/apps/rust/library'
let g:deoplete#sources#rust#show_duplicates=1
let g:deoplete#sources#rust#documentation_max_height=20

" " vim rooter " " 
let g:rooter_manual_only = 0
let g:rooter_patterns = ['=src', '.git', 'Makefile']


" " plugins " "
call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-rooter'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
Plug 'artur-shaik/vim-javacomplete2' "java for deoplete
Plug 'shougo/deoplete-clangx' "c/cpp for deplete
Plug 'deoplete-plugins/deoplete-jedi' " python for deoplete
Plug 'sebastianmarkow/deoplete-rust' " rust for deoplete
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'} " go for deoplete

"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' } "machine learning autocomplete (ram problem)
" Plug 'codota/tabnine-vim'


Plug 'SirVer/ultisnips' " snipet engine
Plug 'honza/vim-snippets' " actually snippets

" Plug 'rafi/awesome-vim-colorschemes' " many colorshcemes

Plug 'justinmk/vim-syntax-extra' "add extra syntax highlight for flex
Plug 'Yggdroot/indentLine' " some indent help
Plug 'Chiel92/vim-autoformat' " auto format code with :AutoFormat

Plug 'preservim/nerdtree' " file tree in the left side
Plug 'jistr/vim-nerdtree-tabs' " NERDTree and tabs together in Vim, painlessly
Plug 'ryanoasis/vim-devicons' " icons for nertree and startify

Plug 'vim-airline/vim-airline' " statusline
Plug 'vim-airline/vim-airline-themes' "themese for statusline

Plug 'junegunn/fzf.vim' "fuzzy file finder (leader + tab)
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



call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang') " Change clang binary path

call deoplete#custom#var('clangx', 'default_c_options', '') " Change clang options
call deoplete#custom#var('clangx', 'default_cpp_options', '')


" call deoplete#custom#var('tabnine', { 'line_limit': 200, 'max_num_results': 5, }) " disabled due to ram usage


