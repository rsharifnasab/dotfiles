set nocompatible " don't need to be compatible with VI

set number " enable numbering of lines
set norelativenumber " not absolute line number
set termguicolors " enable true colors support
set termbidi      " enable persian support
syntax enable " enable syntax highlighting
set showmatch " highlight matching bracket
set showcmd " display incomplete commands
set noshowmode " don't show current mode of editor
set laststatus=2 " last 2 line : show status
"set cursorline " highlight current cursor line
set t_Co=256 " 256 color terminal
set t_ut="" " fix vim background color erase

set wrap " break the text to fill in terminal width
set linebreak " break lines on space, rather than last char
set breakindent " if broke the line, indent the broken part

set mouse=a " use mouse normally
set clipboard=unnamedplus "sync vim clipboard with system clipboard
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
set shiftwidth=4 tabstop=4
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

" scroll before cursur reach the end of screen
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif



" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly

" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste

""""""""""""""""""""""""""""""""""""


" " general remaps " "
" ctrl a -> Select all
map <C-a> <esc>ggVG<CR> 

" control S -> save
noremap  <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
" ctrl L -> clear highlighted search result
nnoremap <silent> <C-L>  :nohlsearch<CR>h<C-L> 
" esc in terminal mode -> exit
tnoremap <Esc> <C-\><C-n> 


" " tabs " "
nnoremap <C-p> :bnext<CR>
nnoremap <C-o> :bprevious<CR>
nmap <C-n> :enew<cr>
noremap <silent> <C-q> :bd<CR> 
" Close current buffer


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
command Q x


" " map most frequent actions with leader

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


""""""""""""""""""""""


function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <F2> :call NumberToggle()<cr> " toggle relative number



"colorscheme torte
"colorscheme ron
"colorscheme peachpuff
colorscheme evening

runtime! ftplugin/man.vim


let &fcs='eob: ' 

