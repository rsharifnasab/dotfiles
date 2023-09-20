set background=dark

" clear background (for kitty background picture)
hi Normal      guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr      guibg=NONE ctermbg=NONE
hi SignColumn  guibg=NONE ctermbg=NONE
hi Whitespace  guibg=NONE ctermbg=NONE


" " airline colorscheme " "
" run: AirlineTheme folan
"let g:airline_theme='random'
"let g:airline_theme='dark'       " good, colorful
"let g:airline_theme='lucios'
"let g:airline_theme='minmalist'  " just grey
"let g:airline_theme='serene'     " classic beautiful
"let g:airline_theme='deep_space' " grey colors
"let g:airline_theme='raven'      " minmal and nice, no distraction
let g:airline_theme='jellybeans' " beautiful! long-term default
"let g:airline_theme='luna'        " green & red, nice


" " color scheme " "

" built-in themes
"colorscheme default " good contrast
"colorscheme ron
"colorscheme peachpuff
"colorscheme evening
"colorscheme zellner " good light mode

" from vim-awesme-colorschemes
let g:afterglow_blackout=1  "(default: 0)
"colorscheme afterglow       " brown with deep good colors
"colorscheme angr            " funny colors on brown
"colorscheme spacecamp       " like spacemacs, grey
"colorscheme PaperColor      " great, candy colors
"colorscheme sonokai         " great, deep black and good colors
"colorscheme minimalist      " goood!
"colorscheme tender           " good colorful
let g:jellybeans_overrides = {
\    'SignColumn': { 'guifg': 'none', 'guibg': 'none',
\              'ctermfg': 'none', 'ctermbg': 'none',
\     },
\}
colorscheme jellybeans


" theme for day:
"colorscheme github          " white, like github
"colorscheme flattened_light " cream bg with orange

"let ayucolor="light"  " for light version of theme
"let ayucolor="dark"   " for dark version of theme
"let ayucolor="mirage" " for mirage version of theme
"colorscheme ayu        " deep black


" " custom hightlights for menu " "
" menu color
" highlight Pmenu     ctermbg=8 guibg=#093d4a guifg=#e7f2dc
" highlight Pmenu     ctermbg=8 guibg=#093d4a guifg=white
" highlight Pmenu     ctermbg=8 guibg=#093d4a guifg=#f7f2e9
" selected item
" highlight PmenuSel  ctermbg=1 guibg=#112257 guifg=#adeaf0
" highlight PmenuSel  ctermbg=1 guibg=#47092f guifg=#fdff94
" highlight PmenuSel  ctermbg=1 guibg=#323f83 guifg=#aebeca
" highlight PmenuSel  ctermbg=1 guibg=#323f83 guifg=yellow
" highlight PmenuSel  ctermbg=1 guibg=#323f83 guifg=#fff343
"scrollbar
"highlight PmenuSbar ctermbg=0 guibg=#555555

let &fcs='eob: '
" dont show tilde in fillchars
