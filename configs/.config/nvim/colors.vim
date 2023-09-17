
" " airline colorscheme " "
"let g:airline_theme='random'
"let g:airline_theme='dark' " good, colorful
"let g:airline_theme='lucios'
"let g:airline_theme='minmalist' " just grey
"let g:airline_theme='bubblegum' " candy
"let g:airline_theme='serene' " classic beautiful
"let g:airline_theme='deep_space' " grey colors
"let g:airline_theme='hybrid' " little distraction, good default
"let g:airline_theme='raven' " minmal and nice, no distraction
let g:airline_theme='jellybeans' " beautiful!

" to change theme in running editor run AirlineTheme folan


" " color scheme " "
set background=dark



" default beautiful
"colorscheme default " good contrast
"colorscheme ron
"colorscheme peachpuff
"colorscheme evening
"colorscheme zellner "good light mode

" added
"colorscheme angr            " funny colors on brown
"colorscheme afterglow       " brown with deep good colors
"colorscheme rdark-terminal2 " again brown, same as default theme
"colorscheme elflord         " like sublime, same as default
"colorscheme spacecamp       " like spacemacs, grey
"colorscheme lucid           " black with beautiful red color
colorscheme PaperColor      " great, candy colors
"colorscheme sonokai         " great, deep balck and good colors
"colorscheme aurora          " seems good, too much blue
"colorscheme minimalist      " goood!
"colorscheme deus            " cute colorful, orange 
"colorscheme hybrid_reverse  " deep black and beautiful colors
"colorscheme tender


" theme for day:
"colorscheme github          " white, like github
"colorscheme flattened_light " cream bg with orange


"let ayucolor="light"  " for light version of theme
"let ayucolor="dark"   " for dark version of theme
"let ayucolor="mirage" " for mirage version of theme
"colorscheme ayu


lua << EOF
    vim.cmd.colorscheme("sweetie")

    vim.g.sweetie = {
      -- Pop-up menu pseudo-transparency
      -- It requires `pumblend` option to have a non-zero value
      pumblend = {
        enable = true,
        transparency_amount = 20,
      },
      -- Override default sweetie color palettes
      -- Palette fields:
      --  bg
      --  fg
      --  bg_hl
      --  bg_alt
      --  fg_alt
      --  grey
      --  dark_grey
      --  red
      --  orange
      --  green
      --  teal
      --  yellow
      --  blue
      --  magenta
      --  violet
      --  cyan
      palette = {
        dark = {},
        light = {},
      },
      -- Override default highlighting groups options
      overrides = {},
      -- Custom plugins highlighting groups
      integrations = {
        lazy = true,
        neorg = true,
        neogit = true,
        neomake = true,
        telescope = true,
      },
      -- Enable custom cursor coloring even in terminal Neovim sessions
      cursor_color = true,
      -- Use sweetie's palette in `:terminal` instead of your default terminal colorscheme
      terminal_colors = true,
      -- Use the legacy dark theme background colors
      use_legacy_dark_bg = false,
    }
EOF


" " hightlight menu colors " "
" menu color
"highlight Pmenu     ctermbg=8 guibg=#093d4a guifg=#e7f2dc
"highlight Pmenu     ctermbg=8 guibg=#093d4a guifg=white
highlight Pmenu     ctermbg=8 guibg=#093d4a guifg=#f7f2e9

" selected item
"highlight PmenuSel  ctermbg=1 guibg=#112257 guifg=#adeaf0
"highlight PmenuSel  ctermbg=1 guibg=#47092f guifg=#fdff94
"highlight PmenuSel  ctermbg=1 guibg=#323f83 guifg=#aebeca
"highlight PmenuSel  ctermbg=1 guibg=#323f83 guifg=yellow
highlight PmenuSel  ctermbg=1 guibg=#323f83 guifg=#fff343

"scrollbar
highlight PmenuSbar ctermbg=0 guibg=#555555


" clear background (for kitty background picture)
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi Whitespace guibg=NONE ctermbg=NONE

let &fcs='eob: '
" dont show tilde with fillchars
