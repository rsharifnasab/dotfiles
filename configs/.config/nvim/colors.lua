function Bamboo()
	require("bamboo").setup({
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
	})
	require("bamboo").load()
end

function Onenord()
	--local colors = require("onenord.colors").load()
	require("onenord").setup({
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
		custom_highlights = {},
		custom_colors = {}, -- Overwrite default colors
	})
	--vim.api.nvim_set_hl(0, 'Normal', { fg = '#BAC2D2', bg = '#1F222d' })
	-- highlight Normal               guifg=#BAC2D2 guibg=#1F222d
end

-- indent blankline
local hooks = require("ibl.hooks")
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
require("ibl").setup({
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
		char = { "│" },
		tab_char = { "│" },
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
})
