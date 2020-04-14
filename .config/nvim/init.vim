" WELCOME TO nvim init.vim FILE " 

" TODO : a good auto complete 
" i tested coc and ale and ... 


" * appereance setting * " 

"enable numbering of lines
set number

"enable syntax highlighting
syntax enable

" set color scheme
colorscheme default
set background=dark 


"highlight matching bracket 
set showmatch

" display incomplete commands
set showcmd

"do not break line in nextlines
set nowrap 




" color of autocompelte menu
highlight Pmenu ctermbg=6 guibg=#f1f1f0
highlight PmenuSel ctermbg=3 guifg=#dddd00 guibg=#1f82cd
"highlight PmenuSbar ctermbg=0 guibg=#d6d6d6


" *********** editor setting ********* " 

"jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" speed optimize 
set ttyfast
set lazyredraw


" set wildmenu like bash complete
set wildmenu
set wildmode=list:longest

" Fix backspace behavior 
set backspace=indent,eol,start

"use mouse in nvim
set mouse=a  

" move cursor any position not just up to last char of text
set virtualedit=all

" sync system clipborad with vim clipboard
" no need of \"+p and \"+y for copy and pasting
set clipboard+=unnamedplus


" keep undo history on buffer change
set hidden


" show current mode of editor 
set showmode




" * tab setting * "
set shiftwidth=4
set smarttab
set expandtab 
set autoindent 
set smartindent 
set nocindent
" Highlight tailing whitespace todo
set list listchars=tab:\ \ ,trail:·


" * search  setting * "
set hlsearch " highlight search result!
set ignorecase " search in case insensetive mode
set smartcase "case sensetive if we have uppercase in queri
set incsearch " search while typing 
set gdefault " global find and repalce by default




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
" smart autocomplete (learning!)
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

" ** snipets ** "
" snipet engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'



" auto close bracket and () and ... 
Plug 'jiangmiao/auto-pairs'

" some indent help
Plug 'Yggdroot/indentLine'


" ** file tree in the left side ** "
" NERDTree and tabs together in Vim, painlessly
Plug 'jistr/vim-nerdtree-tabs'
" nerd tree 
Plug 'preservim/nerdtree'



" statusline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" a theme like atom
"Plug 'tyrannicaltoucan/vim-quantum'


" fuzzy finder (try <leader> with tab)
Plug 'junegunn/fzf.vim'                                           " things you can do with fzf and Vim.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } " fzf is a general-purpose command-line fuzzy finder.


" vim grep, like atoms ctrl-shift-f
Plug 'mileszs/ack.vim'


call plug#end()





" ***** REMAPS ****** "

"use ack (global in file search) with remap:"
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>



" change default exit from terminal mode to esc
tnoremap <Esc> <C-\><C-n>

" toggle nerd tree  with ctrl n
noremap <C-f> :NERDTreeToggle<CR>

" ctrl L for clear highlighted search result
nnoremap <silent> <C-L> :nohlsearch<CR><C-L> 

" Browse airline tabs
nnoremap <C-p> :bnext<CR>
nnoremap <C-o> :bprevious<CR>

" new tab
nmap <C-n> :enew<cr>

" Close current buffer
noremap <silent> <C-q> :bd<CR>


" Select all
map <C-a> <esc>ggVG<CR>


" Map Control S for save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR>


" vim-fzf key binding
nmap <leader><tab> :Files<CR>



" vim global file search with ack engine change:
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


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

"let g:airline_extensions = [] "clear all extensions"
let g:airline#extensions#whitespace#enabled = 0 "dont show ugly wihtespaces"

" tabline setting "
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1 "show buffers in tabline"
let g:airline#extensions#tabline#fnamemod= ':t' "just show filename"

set laststatus=2
let g:airline_theme='bubblegum'
"let g:airline_theme = 'dark'
let g:airline_powerline_fonts=1


" ** Indent Guides ** "
let g:indentLine_enabled=1
let g:indentLine_color_term=230
let g:indentLine_char='|'
"let g:indentLine_char_list = [' ','|', '¦', '┆', '┊']

" *ignore files from showing by nerdtree * "
let NERDTreeIgnore=['\.pyc$','\.class','\~$']


" * ale setting * "
" error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" enable integration with airline.
let g:airline#extensions#ale#enabled = 1
" enable autocomplete in startup



let g:deoplete#enable_at_startup = 1
let g:JavaComplete_EnableDefaultMappings = 0

 call deoplete#custom#var('tabnine', {
\ 'line_limit': 200,
\ 'max_num_results': 5,
\ })
