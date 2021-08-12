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



" " auto formater " "
" au BufWrite * :Autoformat " set auto format on save
let g:autoformat_verbosemode=1 " to enable debug mode

let g:formatdef_my_google_java = '"~/bin/reformat_java"'
let g:formatters_java = ['my_google_java']



" " vim rooter " " 
let g:rooter_manual_only = 0
let g:rooter_patterns = ['src', '.git', 'Makefile', 'go.mod']


" " Indent line " "
let g:indentLine_enabled=1
let g:indentLine_color_term=230
let g:indentLine_char='|'
"let g:indentLine_char_list = [' ','|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['dashboard', 'help']



" " Airline (status line) " "
"let g:airline_extensions = [] "clear all extensions
let g:airline#extensions#whitespace#enabled = 0 "dont show ugly wihtespaces"
let g:airline_powerline_fonts=1

" " tabline setting " "
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers = 1 "show buffers in tabline"
let g:airline#extensions#tabline#fnamemod= ':t' "just show filename"



" rust
"let g:deoplete#sources#rust#racer_binary='/home/roozbeh/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/roozbeh/apps/rust/library'
"let g:deoplete#sources#rust#show_duplicates=1
"let g:deoplete#sources#rust#documentation_max_height=20


" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

