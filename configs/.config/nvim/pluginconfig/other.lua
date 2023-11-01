-- chadtree instead of nerdtree  "
-- https://github.com/ms-jpq/chadtree/blob/chad/docs/FEATURES.md
-- or you can use https://github.com/nvim-tree/nvim-tree.lua

local chadtree_settings = {
	theme = {
		text_colour_set = "solarized_dark_256",
	},
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

-- " " git sings
require("gitsigns").setup({

	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	current_line_blame = true, -- toggle with `:gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = true,
	},
	-- check :help gitsigns-config-current_line_blame_formatter
	current_line_blame_formatter = "<author>, <author_time:%a-%d/%b/%y>",

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Actions
		map("n", "<leader>hs", gs.stage_hunk)
		map("n", "<leader>hr", gs.reset_hunk)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		map("n", "<leader>hS", gs.stage_buffer)
		map("n", "<leader>hu", gs.undo_stage_hunk)
		map("n", "<leader>hR", gs.reset_buffer)
		map("n", "<leader>hp", gs.preview_hunk)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)
		map("n", "<leader>tb", gs.toggle_current_line_blame)
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>td", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
