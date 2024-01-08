set nocompatible " don't need to be compatible with VI

set number " enable numbering of lines
set norelativenumber " not absolute line number

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

set termbidi      " enable persian support
syntax enable " enable syntax highlighting
set lazyredraw " don't redraw screen in macros
set synmaxcol=500 "200 char of line should be highlighted
set showmatch " highlight matching bracket

set showcmd " display incomplete commands
set noshowmode " don't show current mode of editor
set laststatus=2 " last 2 line : show status
"set cursorline " highlight current cursor line
set t_Co=256 " 256 color terminal

set wrap " break the text to fill in terminal width
set linebreak " break lines on space, rather than last char
set breakindent " if broke the line, indent the broken part

set mouse=a " use mouse normally
set clipboard+=unnamedplus "sync vim clipboard with system clipboard
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
set shiftwidth=4 tabstop=4
set smarttab
set expandtab
set autoindent
set smartindent
set nocindent

" " search " "
set nohlsearch " highlight search result!
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
"let g:python3_host_prog = '/usr/bin/python3' " set python path (make sure it work inside venvs


set hidden " keep undo history on buffer change

" save and jump to last position in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" save undo stack in file, available after reopen file
if has("nvim")
    if has('persistent_undo')
        set undofile
        silent !mkdir -p /tmp/nvimundo
        set undodir=/tmp/nvimundo
    endif
else
    if has('persistent_undo')
        set undofile
        silent !mkdir -p /tmp/vimundo
        set undodir=/tmp/vimundo
    endif
endif

set sidescrolloff=5

runtime! ftplugin/man.vim

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

" disable swap file for gopass files
autocmd BufNewFile,BufRead /dev/shm/gopass* setlocal noswapfile nobackup noundofile shada=""
autocmd BufNewFile,BufRead /private/**/gopass** setlocal noswapfile nobackup noundofile shada=""

autocmd BufNewFile *.sh 0r ~/Templates/a.sh
autocmd BufNewFile *.c 0r ~/Templates/main.c
autocmd BufNewFile algorithm.cpp 0r ~/Templates/algorithm.cpp
autocmd BufNewFile tester.cpp 0r ~/Templates/tester.cpp


let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
