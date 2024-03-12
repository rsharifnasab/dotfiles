set background=dark

" clear background (for kitty background picture)
hi Normal      guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi LineNr      guibg=NONE ctermbg=NONE
hi SignColumn  guibg=NONE ctermbg=NONE
hi Whitespace  guibg=NONE ctermbg=NONE


lua <<EOF

function bamboo()
    require("bamboo").setup{
    transparent = false, -- Show/hide background
    dim_inactive = false, -- Dim inactive windows/buffers
    code_style = {
        comments = { italic = true },
        conditionals = { italic = true },
        keywords = {},
        functions = {},
        namespaces = { italic = true },
        parameters = { italic = true },
        strings = {},
        variables = {},
        },
    code_style = {
        comments = { italic = true },
        conditionals = { italic = true },
        keywords = {},
        functions = {},
        namespaces = { italic = true },
        parameters = { italic = true },
        strings = {},
        variables = {},
        },
    }
    require("bamboo").load()
    end

function onenord()
    local colors = require("onenord.colors").load()
    require('onenord').setup({
      theme = "dark", -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
      borders = true, -- Split window borders
      fade_nc = true, -- Fade non-current windows, making them more distinguishable
      -- Style that is applied to various groups: see `highlight-args` for options
      styles = {
        comments = "NONE",
        strings = "NONE",
        keywords = "NONE",
        functions = "NONE",
        variables = "NONE",
        diagnostics = "underline",
      },
      disable = {
        background = false, -- Disable setting the background color
        float_background = false, -- Disable setting the background color for floating windows
        cursorline = false, -- Disable the cursorline
        eob_lines = true, -- Hide the end-of-buffer lines
      },
      -- Inverse highlight for different groups
      inverse = {
        match_paren = false,
      },
      custom_highlights = {
      },
      custom_colors = {}, -- Overwrite default colors
    })
    vim.api.nvim_set_hl(0, 'Normal', { fg = '#BAC2D2', bg = '#1F222d' })
    -- highlight Normal               guifg=#BAC2D2 guibg=#1F222d
end
EOF


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
"colorscheme jellybeans

" lua onenord()

"colorscheme aylin " deep colorful

" theme for day:
"colorscheme github          " white, like github
"colorscheme flattened_light " cream bg with orange

"let ayucolor="light"  " for light version of theme
"let ayucolor="dark"   " for dark version of theme
"let ayucolor="mirage" " for mirage version of theme
" colorscheme ayu        " deep black

"colorscheme aylin " like ayu but better
"highlight Normal guifg=#BAC2D2 guibg=#1F222d

let g:xcodedarkhc_dim_punctuations = 1
let g:xcodedarkhc_green_comments = 0
let g:xcodedarkhc_emph_types = 0
let g:xcodedarkhc_emph_funcs = 0
let g:xcodedarkhc_emph_idents = 0
let g:xcodedarkhc_match_paren_style = 1
"colorscheme xcodedarkhc


lua bamboo()

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
