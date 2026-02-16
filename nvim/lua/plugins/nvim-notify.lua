return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = 3000,
		background_colour = "#000000",
		render = "compact",
		stages = "static",
	},
	config = function(_, opts)
		require("notify").setup(opts)
		vim.notify = require("notify")
	end,
}
