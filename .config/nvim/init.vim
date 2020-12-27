" WELCOME TO nvim init.vim FILE " 

" TODO : a good auto complete 
" i tested coc and ale and ... 
" todo: you complete me 


" * appereance setting * " 

set number " enable numbering of lines
set relativenumber " not absoloute line number
syntax enable " enable syntax highlighting

" set color scheme
try 
    source ~/.config/nvim/themes/PaperColor.vim
catch
    colorscheme ron
    colorscheme peachpuff
endtry
set background=dark

set showmatch " highlight matching bracket


set showcmd " display incomplete commands


"set nowrap "do not break line in nextlines
set wrap "break the text to fill in terminal width
set linebreak " break lines on space, rather than last char
set breakindent " if broke the line, indent the broken part


" fold option
set foldmethod=indent
set foldnestmax=10
set nofoldenable " no fold first time
set foldlevel=5 " close fold auto after how many indents


" color of autocompelte menu
highlight Pmenu ctermbg=6 guibg=#f1f1f0
highlight PmenuSel ctermbg=3 guifg=#dddd00 guibg=#1f82cd
"highlight PmenuSbar ctermbg=0 guibg=#d6d6d6


" *********** editor setting ********* " 
set nocompatible " dont need to be compatible with VI

if has("autocmd")
  "jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" optimize editor speed
set ttyfast
set lazyredraw


" set wildmenu like bash complete
set wildmenu
set wildmode=list:longest

set backspace=indent,eol,start " Fix backspace behavior 


set mouse=a " use mouse normally


"set virtualedit=all " move cursor freely in insert mode


set whichwrap+=<,>,[,] " < and > can change line

" no need of \"+p and \"+y for copy and pasting
set clipboard+=unnamedplus "sync vim clipbiard with systemclipboard

set hidden " keep undo history on buffer change

if has('persistent_undo') "check if your vim version supports it
  " keep track of undo after reopen file
  set undofile   
  silent !mkdir -p /tmp/vimundo
  set undodir=/tmp/vimundo
endif

" show current mode of editor
set showmode


set list listchars=tab:\ \ ,trail:· " Highlight tailing whitespace

" * tab setting * "
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
set nocindent





" * search  setting * "
set hlsearch " highlight search result!
set ignorecase " search in case insensetive mode
set smartcase "case sensetive if we have uppercase in queri
set incsearch " search while typing 
set gdefault " global find and repalce by default

" * spell check with SpellCheck command
command Spellcheck setlocal spell spelllang=en_us



" ** file stuff ** "

" set autochdir " automatically cd to current dir
set noautochdir " do not cd to current folder

set autoread " autom reload file changed outside


set autowriteall " auto write all files before make

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



command! MakeTags !ctags -R . "create tags file


" ***** plugins ***** "
call plug#begin('~/.config/nvim/plugged')


Plug 'justinmk/vim-syntax-extra' "add extra syntax highlight for flex

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete 
Plug 'artur-shaik/vim-javacomplete2' "java for deoplete 
Plug 'shougo/deoplete-clangx' "c/cpp for deplete
Plug 'deoplete-plugins/deoplete-jedi' " python for deoplete 


"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' } "machine learning autocomplete
" (disabled due to ram usage)


Plug 'SirVer/ultisnips' " snipet engine
Plug 'honza/vim-snippets' " actually snippets

Plug 'Yggdroot/indentLine' " some indent help
Plug 'Chiel92/vim-autoformat' " auto format code with :AutoFormat

Plug 'preservim/nerdtree' " file tree in the left side
Plug 'jistr/vim-nerdtree-tabs' " NERDTree and tabs together in Vim, painlessly

Plug 'ryanoasis/vim-devicons' " icons for nertree and startify

" Plug 'rafi/awesome-vim-colorschemes' " many colorshcemes 

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



" ***** REMAPS ****** "


" ctrl a -> Select all
map <C-a> <esc>ggVG<CR>

" control S -> save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S>  <C-O>:update<CR>

" ctrl L -> clear highlighted search result
nnoremap <silent> <C-L> :nohlsearch<CR><C-L> 

" esc in terminal mode -> exit
tnoremap <Esc> <C-\><C-n>

" toggle nerd tree  with ctrl n
noremap <C-f> :NERDTreeToggle<CR>

" tabs (airline)
nnoremap <C-p> :bnext<CR>
nnoremap <C-o> :bprevious<CR>
nmap <C-n> :enew<cr>
" Close current buffer
noremap <silent> <C-q> :bd<CR>


"use ack (global in file search)"
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" vim-fzf key binding
nmap <leader><tab> :FZF<CR>

""""""""""""""""

" vim global file search with ack engine change:
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" " deoplete " "
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang') " Change clang binary path
" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')


" setup makeprg to compile programs
"autocmd FileType c set makeprg=!make||gcc\ -g\ -Wall\ '%'
"autocmd FileType cpp set makeprg=!make||g++\ -g\ -Wall\ '%'
"autocmd FileType java set makeprg=!make\ ||\ javac\ '%'


" deoplete for java 
autocmd FileType java setlocal omnifunc=javacomplete#Complete


" ***** let settings ***** "

let mapleader="\\" " set the leader key

let g:python3_host_prog = '/usr/bin/python3' " set python path (make sure it work inside venvs


" * Airline (status line) * "
"let g:airline_extensions = [] "clear all extensions
let g:airline#extensions#whitespace#enabled = 0 "dont show ugly wihtespaces"

" tabline setting "
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1 "show buffers in tabline"
let g:airline#extensions#tabline#fnamemod= ':t' "just show filename"


set laststatus=2
"let g:airline_theme='bubblegum'
"let g:airline_theme='badwolf'
"let g:airline_theme='tomorrow'
"let g:airline_theme='minimalist'
"let g:airline_theme='lucius'
"let g:airline_theme='random'
"let g:airline_theme = 'dark'
let g:airline_theme='serene'
let g:airline_powerline_fonts=1


" ** Indent Guides ** "
let g:indentLine_enabled=1
let g:indentLine_color_term=230
let g:indentLine_char='|'
"let g:indentLine_char_list = [' ','|', '¦', '┆', '┊']


" *ignore files from showing by nerdtree * "
let NERDTreeIgnore=['\.pyc$','\.class','\~$','\.out']


" * ale setting * "
" error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1 " enable integration with airline.


" enable autocomplete in startup
let g:deoplete#enable_at_startup = 1
let g:JavaComplete_CheckServerVersionAtStartup = 0
let g:JavaComplete_EnableDefaultMappings = 0

" disabled due to ram usage
" call deoplete#custom#var('tabnine', {
" \ 'line_limit': 200,
" \ 'max_num_results': 5,
" \ })



" " AUTO FORMATER " "
" au BufWrite * :Autoformat " set auto format on save
" let g:autoformat_verbosemode=1 " to enable debug mode


" " vim go " "
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
