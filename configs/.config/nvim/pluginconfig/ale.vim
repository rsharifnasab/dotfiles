" " ale " "
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_list_window_size = 5
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1 " enable integration with airline.

let g:ale_disable_lsp = 1 " let coc do the stuff

let g:ale_linters = {
\   'go': ['gobuild', 'govet', 'staticcheck', 'gotype', 'golangserver', 'gosimple' , 'gopls', 'gometalinter' , 'gofmt', 'bingo', 'golangci-lint'],
\   'text': ['languagetool', 'vale', 'alex'],
\}

let g:ale_fixers = {
\   'elixir': ['mix_format'],
\   'text': ['remove_trailing_lines', 'trim_whitespace'],
\}

