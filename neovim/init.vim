" WELCOME TO nvim init.vim FILE " 



" ****** set variables ****** "




" * appeereance setting * " 

"enable numbering of lines
set number

"enable syntax highlighting
syntax enable

" set color scheme
colorscheme default
set background=dark 

"highlight matchinh bracket? 
set showmatch

" display incomplete commands
set showcmd

"do not break line in nextlines
set nowrap 

"use mouse in nvim
set mouse=a



" statusline setting

" show status bar 
set laststatus=2

" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)



" * tab setting * "
set shiftwidth=4
set smarttab
set expandtab 
set autoindent 
set smartindent 
" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·


" * search  setting * "
set hlsearch " highlight search result!
set ignorecase " search in case insensetive mode
set smartcase "case sensetive if we have uppercase in queri
set incsearch " search while typing 
set gdefault " global find and repalce by default



" ** some other stuff ** "

" sync system clipborad with vim clipboard
" no need of \"+p and \"+y for copy and pasting
set clipboard+=unnamedplus


" show current mode of editor 
set showmode







" ** file stuff ** "

" automatically cd to curredt dir
set autochdir

" automatically reload file it is changed outdie of vim
set autoread

" detect setting base on file type 
filetype on 
filetype indent on 
filetype plugin on

set encoding=utf-8

" do not create extra junk files
set nobackup
set nowritebackup
set noswapfile







" ***** plugins ***** "

call plug#begin('~/.config/nvim/plugged')

" auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" auto close bracket and () and ... 
Plug 'jiangmiao/auto-pairs'

" file tree in the left side

" NERDTree and tabs together in Vim, painlessly
Plug 'jistr/vim-nerdtree-tabs'
" nerd tree 
Plug 'preservim/nerdtree'


" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()






" ***** REMAPS ****** "

" change default exit from terminal mode to esc
tnoremap <Esc> <C-\><C-n>

" toggle nerd tree  with ctrl n
noremap <C-n> :NERDTreeToggle<CR>

" ctrl L for clear highlighted search result
nnoremap <silent> <C-L> :nohlsearch<CR><C-L> 

" Let's move between tabs and create them with ease
nnoremap <C-w>n :tabnext<CR>
nnoremap <C-w>p :tabprevious<CR>
nnoremap <C-w>c :tabnew<CR>






" ***** let settings ***** "

" * Airline (status line) * "
"let g:airline_extensions = []
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'



" enable autocomplete in startup
let g:deoplete#enable_at_startup = 1
