" " ctags " "
command! MakeTags !ctags -R .
"create tags file


" " chadtree instead of nerdtree  "
" https://github.com/ms-jpq/chadtree/blob/chad/docs/FEATURES.md
" or you can use https://github.com/nvim-tree/nvim-tree.lua
nnoremap <C-f> <cmd>CHADopen<cr>
" let NERDTreeIgnore=['\.pyc$','\.class','\~$','\.out', '\.exe']
" ignore files from nerdtree
lua<<EOF
local chadtree_settings = {
    theme = {
        text_colour_set = "solarized_dark_256",
        },
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

EOF


" " auto formater " "
" install more tools from:
" https://github.com/sbdchd/neoformat#supported-filetypes
let g:neoformat_basic_format_align = 1 " Enable alignment
let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
let g:neoformat_basic_format_trim = 1 " Enable trimmming of trailing whitespace
let g:neoformat_run_all_formatters = 1 " run all formaters even when the first one is ok
" fix undo problem with autoformat
augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END


let g:astyle_opt="--quiet --mode=java --style=java --indent-after-parens --indent-classes --indent-switches --break-blocks --pad-comma --unpad-paren --add-braces --convert-tabs --delete-empty-lines"
let g:shfmt_opt="-ci"


" " git sings
lua <<EOF
require('gitsigns').setup{

on_attach = function(bufnr)
local gs = package.loaded.gitsigns

local function map(mode, l, r, opts)
opts = opts or {}
opts.buffer = bufnr
vim.keymap.set(mode, l, r, opts)
end

-- Navigation
map('n', ']c', function()
if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
    if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk)
        map('n', '<leader>hr', gs.reset_hunk)
        map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hS', gs.stage_buffer)
        map('n', '<leader>hu', gs.undo_stage_hunk)
        map('n', '<leader>hR', gs.reset_buffer)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line{full=true} end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
}
EOF


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

