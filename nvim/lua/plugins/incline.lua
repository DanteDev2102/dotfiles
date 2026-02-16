return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	opts = {
		window = { margin = { vertical = 0, horizontal = 1 } },
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			if filename == "" then
				filename = "[No filename]"
			end

			local modified = vim.bo[props.buf].modified and " ●" or ""
			local icon, color = require("nvim-web-devicons").get_icon_color(filename)

			return {
				{ icon, guifg = color },
				{ " " },
				{ filename, gui = "bold" },
				{ modified, guifg = "#ff9e64" },
			}
		end,
	},
}
