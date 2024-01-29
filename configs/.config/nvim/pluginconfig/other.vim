" " ctags " "
command! MakeTags !ctags -R .
"create tags file

" " auto formater " "
" install more tools from:
" https://github.com/sbdchd/neoformat#supported-filetypes
let g:neoformat_basic_format_align = 0 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1  " Enable trimmming of trailing whitespace
let g:neoformat_run_all_formatters = 1 " run all formaters even when the first one is ok
au BufWritePre * if &ft !~ '^\(yaml\|yml\)$' | try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | endtry | endif


let g:neoformat_cpp_astyle = {
    \ 'exe': 'astyle',
    \ 'args': [ '--quiet', '--mode=java', '--style=java',
    \ '--indent-after-parens', '--indent-classes', '--indent-switches',
    \ '--break-blocks', '--pad-comma', '--unpad-paren', '--add-braces',
    \ '--convert-tabs',
    \ ],
    \ 'stdin': 0,
    \ 'replace': 1,
    \ }


let g:astyle_opt="--quiet --mode=java --style=java --indent-after-parens --indent-classes --indent-switches --break-blocks --pad-comma --unpad-paren --add-braces --convert-tabs --delete-empty-lines"
let g:shfmt_opt="-ci"


" " vim rooter " "
let g:rooter_manual_only = 0
let g:rooter_patterns = ['src', '.git', 'Makefile', 'go.mod']


" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
