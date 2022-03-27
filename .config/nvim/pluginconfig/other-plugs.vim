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

let g:formatdef_my_astyle = '"astyle --quiet --mode=java --style=java --indent-after-parens --indent-classes --indent-switches --break-blocks --pad-comma --unpad-paren --add-braces --convert-tabs --delete-empty-lines"'
let g:formatters_java = ['my_astyle']



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
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_detect_modified=1

" " tabline setting " "
"
let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#tabline#show_buffers = 1 "show buffers in tabline"

" tabs splitter character
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#overflow_marker = '…'

" each buffer label
"let g:airline#extensions#tabline#fnamemod= ':t'   " just show filename
let g:airline#extensions#tabline#fnamemod= ':t:r'   " just show filename, no
"extension
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " like zsh abbrv
"let g:airline#extensions#tabline#formatter = 'unique_tail' " simple 



let airline#extensions#tabline#current_first = 0 " bring selected tab to first 
let g:airline#extensions#tabline#show_tab_count = 1 "only show tab count if there is one tab (not buffer)
let g:airline#extensions#tabline#show_tab_type = 0   " buffer or tab at right
let g:airline#extensions#tabline#buf_label_first = 0 " buffer or tab at left
let g:airline#extensions#tabline#buffer_nr_show = 0 " each buffer number
let g:airline#extensions#tabline#buffer_min_count = 2 " minimum buffer count to show tabline

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let g:airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

let g:airline#extensions#nerdtree_statusline = 1

" rust
"let g:deoplete#sources#rust#racer_binary='/home/roozbeh/.cargo/bin/racer'
"let g:deoplete#sources#rust#rust_source_path='/home/roozbeh/apps/rust/library'
"let g:deoplete#sources#rust#show_duplicates=1
"let g:deoplete#sources#rust#documentation_max_height=20


" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" " git gutter " " 
set updatetime=100
set signcolumn=yes
let g:gitgutter_map_keys = 0
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

