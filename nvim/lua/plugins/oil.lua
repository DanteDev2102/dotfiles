return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, "..")
				end,
			},
			float = {
				padding = 2,
				max_width = 80,
				max_height = 20,
				border = "rounded",
				win_options = {
					winblend = 10,
				},
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["<leader>ff"] = {
					callback = function()
						require("telescope.builtin").find_files({
							cwd = require("oil").get_current_dir(),
						})
					end,
					desc = "Telescope Find Files (Current Directory)",
				},
				["<leader>fg"] = {
					callback = function()
						require("telescope.builtin").live_grep({
							cwd = require("oil").get_current_dir(),
						})
					end,
					desc = "Telescope Live Grep (Current Directory)",
				},
			},
		})

		vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil (Float)" })
	end,
}
