" " ctags " "
command! MakeTags !ctags -R .
"create tags file

let g:neoformat_enabled_java = ['astyle']
let g:astyle_opt="--quiet --mode=java --style=java --indent-after-parens --indent-classes --indent-switches --break-blocks --pad-comma --unpad-paren --add-braces --convert-tabs --delete-empty-lines"
let g:shfmt_opt="-ci"


" " vim rooter " "
let g:rooter_manual_only = 0
let g:rooter_patterns = ['src', '.git', 'Makefile', 'go.mod']


" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
