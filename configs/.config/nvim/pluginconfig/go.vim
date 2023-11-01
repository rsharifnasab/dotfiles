" vim-go
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

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1

let g:go_textobj_include_function_doc = 1
let g:go_fmt_fail_silently = 1

let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'golangci-lint']
let g:go_metalinter_deadline = "9s"


autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>e  <Plug>(go-iferr)

"autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

