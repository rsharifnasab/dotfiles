colorscheme default

" RANDOM THEMES CONFIG
let g:afterglow_blackout=1  "(default: 0)

let g:jellybeans_overrides = {
            \    'SignColumn': { 'guifg': 'none', 'guibg': 'none',
            \              'ctermfg': 'none', 'ctermbg': 'none',
            \     },
            \}

let g:xcodelightkhc_dim_punctuations = 1
let g:xcodelighthc_green_comments = 0
let g:xcodelighthc_emph_types = 0
let g:xcodelighthc_emph_funcs = 0
let g:xcodelighthc_emph_idents = 0
let g:xcodelighthc_match_paren_style = 1

let g:xcodedarkhc_dim_punctuations = 1
let g:xcodedarkhc_green_comments = 0
let g:xcodedarkhc_emph_types = 0
let g:xcodedarkhc_emph_funcs = 0
let g:xcodedarkhc_emph_idents = 0
let g:xcodedarkhc_match_paren_style = 1

let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

" MAIN CONFIG

" dont show tilde in fillchars
let &fcs='eob: '

" clear background (for kitty background picture)
hi Normal      guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr      guibg=NONE ctermbg=NONE
hi SignColumn  guibg=NONE ctermbg=NONE
hi Whitespace  guibg=NONE ctermbg=NONE

" git signs no highlight
highlight GitSignsAdd          guifg=#009900 ctermfg=2
highlight GitSignsChange       guifg=#bbbb00 ctermfg=3
highlight GitSignsChangeDelete guifg=#bbbb00 ctermfg=3
highlight GitSignsDelete       guifg=#ff2222 ctermfg=1
highlight GitSignsTopDelete    guifg=#ff2222 ctermfg=1
highlight GitSignsUntracked    guifg=#ff2222 ctermfg=1

" highlight Normal guifg=#BAC2D2 guibg=#1F222d

" GOOD THEMES
"
" BUILT IN VIM THEMES
" colorscheme ron
" colorscheme peachpuff
" colorscheme evening
" colorscheme zellner "good light mode

" FROM OTHER PACKAGES (NIGHT)
" colorscheme afterglow       " brown with deep good colors
" colorscheme angr            " funny colors on brown
" colorscheme spacecamp       " like spacemacs, grey
" colorscheme PaperColor      " great, candy colors
" colorscheme sonokai         " great, deep black and good colors
" colorscheme minimalist      " goood!
" colorscheme tender          " good colorful
" colorscheme jellybeans
" colorscheme ayu             " deep black
" colorscheme aylin           " like ayu but better
" colorscheme xcodedarkhc
" lua Onenord()
" lua Bamboo()

" FROM OTHER PACKAGES (DAY)
" colorscheme github          " white, like github
" colorscheme flattened_light " cream bg with orange
" colorscheme xcodelighthc

" LUALINE THEMES (DARK)
" lua require('lualine').setup{options = {theme = 'auto'}}
" lua require('lualine').setup{options = {theme = 'ayu_mirage'}}
" lua require('lualine').setup{options = {theme = 'material'}}
" lua require('lualine').setup{options = {theme = 'palenight'}}
" LIGHT
" lua require('lualine').setup{options={theme='ayu_light'}}
" lua require('lualine').setup{options={theme='tomorrow'}}
" https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md

function! Dark()
    set background=dark
    colorscheme default
    lua Bamboo()
    lua require('lualine').setup{options = {theme = 'material'}}
endfunc
nnoremap <F4> :call Dark()<cr>

function! Light()
    set background=light
    colorscheme xcodelighthc
    lua require('lualine').setup{options={theme='tomorrow'}}
endfunc
nnoremap <F3> :call Light()<cr>

:call Dark()
