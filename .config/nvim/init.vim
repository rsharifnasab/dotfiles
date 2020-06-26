" WELCOME TO nvim init.vim FILE " 

" TODO : a good auto complete 
" i tested coc and ale and ... 
" todo: you complete me 




""""""""""""" CHEATS """"""""""""
" 
" " " BUILTIN COMMANDS CHEAT
" zz, zt, zb, z. -> change screen position
" H,M,L -> change cursor position in current screen
"
" set relativenumber -> shomare khat ha faseleshoun ba jayee ke hasti
" . -> repeat last command
"
" gf: edit the file which its name is under curser
"
"~: chane case lower to upper and otherwise
"
"^: start of line (after spaces)
" +,-: next line after prev line (first char after whitespace)
" gg: first line of gile 
" G: last line of file
" move with () and { }
" 
"
" " " MARKS
" ma to mz : save current place 
" `a to `z : go back to mark
"
" " " FUZZY FILE finder 
" instead of fuzzy file, we just do with :find 
" vim-fzf <leader><tab>
"
"
" " " FIND IN FILES 
" (like atoms ctrl-shift-f)
" Ack! or leader+f
"
"
"
" " " TAGS
"(install ctags first)
" create tags file  with 'MakeTags'
" ^] to jump the definition of tag under cursor 
" and ^t to jump back at the first place
"
"
"
" " " AUTOCOMPLETE
" vim built in autocomplete (ins-complete)
" ^n: normal complete
" ^x^n: complete from just this file 
" ^x^f complete filenames 
" ^x^] complete tags only
"
"
"
"
" " " OTHERS
" ctrl L for clear highlighted search result
" ctrl+f: nerdtree
"
"
"
"
" " " TABS ANS BUFFERS
" Browse tabs <C-p> ans <C-o> 
" New tab <C-n>
" Close current buffer <C-q> 
"
"
"
"
"
"""""""""""""""""""""""""""""""""



" * appereance setting * " 

"enable numbering of lines
set number

"enable syntax highlighting
syntax enable

" set color scheme
colorscheme ron "default
set background=dark 


"highlight matching bracket 
set showmatch

" display incomplete commands
set showcmd

"do not break line in nextlines
"set nowrap 

"break the text to fill in terminal width
set wrap


set linebreak

" if broke the line, indent the broken part
set breakindent



" color of autocompelte menu
highlight Pmenu ctermbg=6 guibg=#f1f1f0
highlight PmenuSel ctermbg=3 guifg=#dddd00 guibg=#1f82cd
"highlight PmenuSbar ctermbg=0 guibg=#d6d6d6


" *********** editor setting ********* " 
" dont need to be compatible with VI
set nocompatible

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
"set virtualedit=all

" make left and right arrow keys change line
set whichwrap+=<,>,[,] ",h,l

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
"set autochdir

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


" instead of fuzzy file, we just do with :find 
set path+=**


"create tags file (install ctags first)
command! MakeTags !ctags -R .
" now we can: ^] to jump the definition of tag under cursor 
" and ^t to jump back at the first place



" vim built in autocomplete (ins-complete)
" ^n: normal complete
" ^x^n: complete from just this file 
" ^x^f complete filenames 
" ^x^] complete tags only




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
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
"disabled due to ram usage 



" ** snipets ** "
" snipet engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine.
Plug 'honza/vim-snippets'


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
" fzf is a general-purpose command-line fuzzy finder.
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' } 


" vim grep, like atoms ctrl-shift-f (by Ack! or leader+f)
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
nmap <leader><tab> :FZF<CR>



" vim global file search with ack engine change:
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')





" deoplete for java 
autocmd FileType java setlocal omnifunc=javacomplete#Complete




" ***** let settings ***** "

" set the leader key
let mapleader="\\"

" set python path (make sure it work inside venvs
let g:python3_host_prog = '/usr/bin/python3'


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

" disabled due to ram usage
" call deoplete#custom#var('tabnine', {
" \ 'line_limit': 200,
" \ 'max_num_results': 5,
" \ })
