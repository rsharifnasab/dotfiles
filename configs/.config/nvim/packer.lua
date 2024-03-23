local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer = require("packer")
local use = packer.use

packer.startup(function()
	use("wbthomason/packer.nvim")
	--use "tversteeg/registers.nvim" -- press " to show registers content
	--use 'wakatime/vim-wakatime' -- time track my programming
	-- Stable version of coc autocomplete
	use({
		"neoclide/coc.nvim",
		branch = "release",
	})
	use("dense-analysis/ale") -- ale for foreign linting

	-- ETC
	use("editorconfig/editorconfig-vim")
	use("airblade/vim-rooter") -- set root based on .git
	use("lewis6991/gitsigns.nvim") -- changed lines from HEAD
	use({
		"romgrk/barbar.nvim",
		requires = {
			{ "lewis6991/gitsigns.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
		},
	})

	-- formatter plugin
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

    -- draw a line to show tabs
	use("lukas-reineke/indent-blankline.nvim")

	-- search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "BurntSushi/ripgrep" },
		},
	})

	-- language specific
	use("towolf/vim-helm")
	use("justinmk/vim-syntax-extra") -- add extra syntax highlight for flex
	use("elixir-editors/vim-elixir")
	use("ekalinin/Dockerfile.vim")
	use("rust-lang/rust.vim")
	use({
		"fatih/vim-go",
		run = ":GoUpdateBinaries",
	})

	-- snippets
	use("SirVer/ultisnips") -- snippet engine
	use("honza/vim-snippets") -- actually snippets

	-- file explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup()
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- beautiful airline
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- themes
	use("rafi/awesome-vim-colorschemes")
	use("rmehri01/onenord.nvim")
	use("AhmedAbdulrahman/vim-aylin")
	use("arzg/vim-colors-xcode")
	use("ribru17/bamboo.nvim")

	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = [[
            require'treesitter-context'.setup{}
        ]],
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = [[
            require'nvim-treesitter.configs'.setup {
               ensure_installed = { "c", "lua", "rust", "java", "cpp", "python", "go", "yaml", "bash" },

               -- Install parsers synchronously (only applied to `ensure_installed`)
               sync_install = false,


               highlight = {
                  enable = true,

                  -- disable = { "c", "rust" },

                  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                  -- Using this option may slow down your editor, and you may see some duplicate highlights.
                  -- Instead of true it can also be a list of languages
                  additional_vim_regex_highlighting = false,
              },
            }
        ]],
	})
end)

vim.g.coc_global_extensions = {
	"coc-html",
	"coc-css",
	"coc-tsserver",
	"coc-tslint-plugin",
	"coc-json",
	"coc-yaml",
	"coc-rust-analyzer",
	"coc-pyright",
	"coc-java",
	"coc-clangd",
	"coc-tag",
	"coc-elixir",
	"coc-lua",
	"coc-go",
	"coc-sh",
	-- coc-tag : add autocomplete source: tags file
}
