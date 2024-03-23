local slow_format_filetypes = {}

local function format_on_save_func(bufnr)
	if slow_format_filetypes[vim.bo[bufnr].filetype] then
		return
	end
	local function on_format(err)
		if err and err:match("timeout$") then
			slow_format_filetypes[vim.bo[bufnr].filetype] = true
		end
	end
	-- Disable with a global or buffer-local variable
	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
		return
	end
	-- Disable autoformat for files in a certain path
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if bufname:match("/node_modules/") then
		return
	end
	require("conform").format({ timeout_ms = 1000, lsp_fallback = true }, on_format)
end

local function format_after_save_func(bufnr)
	if not slow_format_filetypes[vim.bo[bufnr].filetype] then
		return
	end
	-- Disable with a global or buffer-local variable
	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
		return
	end
	-- Disable autoformat for files in a certain path
	local bufname = vim.api.nvim_buf_get_name(bufnr)
	if bufname:match("/node_modules/") then
		return
	end
	require("conform").format({ lsp_fallback = true, timeout_ms = 5000, async = true })
end

require("conform").setup({

	-- Conform will run multiple formatters sequentially
	-- Use a sub-list to run only the first available formatter
	formatters_by_ft = {
		justfile = { "just" },
		yaml = { { "prettierd", "prettier" }, "yamlfmt", "yq", "yamlfix" },
		json = { "jq", { "prettierd", "prettier" } },
		md = { "injected", { "prettierd", "prettier" } },
		lua = { "stylua" },
		c = { { "astyle", "clang_format" } },
		cpp = { { "astyle", "clang_format" } },
		java = { "astyle", "goole-java-format" },
		go = { "goimports", "gofmt", "gofumpt", "gci" },
		python = { "isort", "black", "pyflakes", "autopep8" },
		py = { "isort", "black", "pyflakes", "autopep8" },
		shell = { "shfmt", "shellcheck" },

		html = { { "prettierd", "prettier" } },
		javascript = { { "prettierd", "prettier" } },
		ts = { { "prettierd", "prettier" } },
		jsx = { { "prettierd", "prettier" } },
		css = { { "prettierd", "prettier" } },
		less = { { "prettierd", "prettier" } },
		scss = { { "prettierd", "prettier" } },

		-- all files
		["*"] = { "trim_whitespace", "trim_newlines" },
		-- all with unrecognized type
		["_"] = { "codespell" },
	},

	notify_on_error = true,
})

vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		format_on_save_func(args.buf)
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function(args)
		format_after_save_func(args.buf)
	end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	-- FormatDisable! will disable formatting just for this buffer
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.api.nvim_set_keymap("n", "<leader>l", ":Format<CR>", { noremap = true })
