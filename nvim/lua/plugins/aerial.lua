return {
	"stevearc/aerial.nvim",
	opts = {
		filter_kind = {
			"Class",
			"Constructor",
			"Enum",
			"Function",
			"Interface",
			"Module",
			"Method",
			"Structs",
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>cs", "<cmd>AerialToggle! left<cr>", desc = "Map Symbols" },
	},
}
