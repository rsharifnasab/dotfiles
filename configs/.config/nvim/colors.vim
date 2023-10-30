
set background=dark

" clear background (for kitty background picture)
hi Normal      guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr      guibg=NONE ctermbg=NONE
hi SignColumn  guibg=NONE ctermbg=NONE
hi Whitespace  guibg=NONE ctermbg=NONE


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

" https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
lua <<END
require('lualine').setup{
options = {
    theme = 'ayu_mirage',
},
}
END

lua <<END
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup {
    indent = {
        highlight = highlight,
    },
    scope = {
        show_start = false,
        show_end = false,
    },
    exclude = {
        filetypes = {
            "dashboard",
        },
    },
}
END
