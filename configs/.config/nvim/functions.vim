
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <F2> :call NumberToggle()<cr> " toggle relative number

function DisableSyntaxTreesitter()
    if exists(':TSBufDisable')
        exec 'TSBufDisable autotag'
        exec 'TSBufDisable highlight'
        exec 'TSBufDisable incremental_selection'
        exec 'TSBufDisable indent'
        exec 'TSBufDisable playground'
        exec 'TSBufDisable query_linter'
        exec 'TSBufDisable rainbow'
        exec 'TSBufDisable refactor.highlight_definitions'
        exec 'TSBufDisable refactor.navigation'
        exec 'TSBufDisable refactor.smart_rename'
        exec 'TSBufDisable refactor.highlight_current_scope'
        exec 'TSBufDisable textobjects.swap'
        " exec 'TSBufDisable textobjects.move'
        exec 'TSBufDisable textobjects.lsp_interop'
        exec 'TSBufDisable textobjects.select'
    endif

    set foldmethod=manual
endfunction

augroup BigFileDisable
    autocmd!
    autocmd BufReadPre,FileReadPre * if getfsize(expand("%")) > 512 * 1024 | exec DisableSyntaxTreesitter() | endif
augroup END

command! -range -nargs=0 ModsExplain :'<,'>w !mods explain this, be very succint
command! -range -nargs=* ModsRefactor :'<,'>!mods refactor this to improve its readability
command! -range -nargs=+ Mods :'<,'>w !mods <q-args>
