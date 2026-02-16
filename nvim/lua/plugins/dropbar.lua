return {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local dropbar = require("dropbar")

		dropbar.setup({
			bar = {
				attach_events = {
					"BufWinEnter",
					"BufWritePost",
					"CursorHold",
				},
			},
		})

		vim.keymap.set("n", "<leader>dr", function()
			require("dropbar.api").pick()
		end, { desc = "Navegar con Dropbar" })
	end,
}
