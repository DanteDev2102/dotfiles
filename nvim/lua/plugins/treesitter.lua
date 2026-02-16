return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	tag = "v0.9.3",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.filetype.add({
			extension = {
				bru = "bru",
			},
		})
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"go",
				"gomod",
				"rust",
				"python",
				"nix",
				"bash",
				"json",
				"yaml",
				"toml",
				"sql",
				"svelte",
				"astro",
				"proto",
				"dockerfile",
				"markdown",
				"markdown_inline",
				"html",
				"http",
				"graphql",
				"javascript",
				"typescript",
				"tsx",
				"css",
				"gosum",
			},

			auto_install = true,

			sync_install = false,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = { enable = true },

			autotag = { enable = true },

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
