" WELCOME TO nvim init.vim FILE " 

" TODO : a good auto complete 
" i tested coc and ale and ... 

" ****** set variables ****** "




" * appereance setting * " 

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


" color of autocompelte menu
highlight Pmenu ctermbg=6 guibg=#f1f1f0
highlight PmenuSel ctermbg=3 guifg=#dddd00 guibg=#1f82cd
"highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

" statusline setting

" show status bar 
set laststatus=2


"jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




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

" *** auto complete *** "
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" java for deoplete
Plug 'artur-shaik/vim-javacomplete2'
" c/c++ for deoplete 
Plug 'shougo/deoplete-clangx'
" python for deoplete 
Plug 'deoplete-plugins/deoplete-jedi'


" ** snipets ** "
" snipet engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'



" auto close bracket and () and ... 
Plug 'jiangmiao/auto-pairs'



" ** file tree in the left side ** "
" NERDTree and tabs together in Vim, painlessly
Plug 'jistr/vim-nerdtree-tabs'
" nerd tree 
Plug 'preservim/nerdtree'



" statusline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



" fuzzy finder (try space with tab)
Plug 'junegunn/fzf.vim'                                           " things you can do with fzf and Vim.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } " fzf is a general-purpose command-line fuzzy finder.


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


" vim-fzf key binding
nmap <leader><tab> :Files<CR>







" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')






" deoplete for java (keymaps) 

autocmd FileType java setlocal omnifunc=javacomplete#Complete

nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)


nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)

nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)


nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)






" ***** let settings ***** "


let mapleader="\\"


" * Airline (status line) * "


"let g:airline_extensions = []
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dark'


" *ignore files for nerdtree * "
let NERDTreeIgnore=['\.pyc$','\.class','\~$']


" enable autocomplete in startup
let g:deoplete#enable_at_startup = 1
let g:JavaComplete_EnableDefaultMappings = 0



