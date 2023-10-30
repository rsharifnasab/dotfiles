" " ctags " "
command! MakeTags !ctags -R .
"create tags file


" " nerd tree " "
noremap <C-f> :NERDTreeToggle<CR> " toggle nerd tree  with ctrl n
let NERDTreeIgnore=['\.pyc$','\.class','\~$','\.out', '\.exe']
" ignore files from nerdtree


" " auto formater " "
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
let g:neoformat_run_all_formatters = 1 " run all formaters even when the first one is ok
" fix undo problem with autoformat
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END


" astyle --quiet --mode=java --style=java --indent-after-parens --indent-classes --indent-switches --break-blocks --pad-comma --unpad-paren --add-braces --convert-tabs --delete-empty-lines
"let g:formatters_java = ['my_astyle']



" " vim rooter " " 
let g:rooter_manual_only = 0
let g:rooter_patterns = ['src', '.git', 'Makefile', 'go.mod']



" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" " git gutter " " 
set updatetime=100
set signcolumn=yes
let g:gitgutter_map_keys = 0
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

