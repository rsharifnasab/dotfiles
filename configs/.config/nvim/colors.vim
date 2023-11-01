
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


let &fcs='eob: ' " dont show tilde in fillchars


lua <<END
-- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
require('lualine').setup{
    options = {
        theme = 'ayu_mirage',
    },
}

-- indent blankline

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
        highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        },
        -- check: :h ibl.config.indent.char
        char = {"│"},
        tab_char = {"│"},
    },
    scope = {
        enabled = false,
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

" git signs no highlight
highlight GitSignsAdd          guifg=#009900 ctermfg=2
highlight GitSignsChange       guifg=#bbbb00 ctermfg=3
highlight GitSignsChangeDelete guifg=#bbbb00 ctermfg=3
highlight GitSignsDelete       guifg=#ff2222 ctermfg=1
highlight GitSignsTopDelete    guifg=#ff2222 ctermfg=1
highlight GitSignsUntracked    guifg=#ff2222 ctermfg=1
