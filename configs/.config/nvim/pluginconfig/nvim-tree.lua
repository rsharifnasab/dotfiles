require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true, -- Turn into false from true by default
	},
})
