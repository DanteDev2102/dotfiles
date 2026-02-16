return {
	{
		"nvim-telescope/telescope.nvim",
		version = "v0.2.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-ui-select.nvim",
			"stevearc/aerial.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local themes = require("telescope.themes")

			telescope.setup({
				defaults = {
					path_display = { "smart" },

					sorting_strategy = "ascending",
					layout_config = {
						horizontal = { prompt_position = "top", preview_width = 0.55 },
						width = 0.87,
						height = 0.80,
					},

					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<Esc>"] = actions.close,
						},
					},

					file_ignore_patterns = {
						"node_modules/",
						".git/",
						"dist",
						"build",
						"%.lock",
						"vendor",
						"venv",
						"%.pyc",
						"tmp",
						"temp",
					},
				},

				pickers = {
					find_files = {
						hidden = true,
					},

					live_grep = {
						only_sort_text = true,
						theme = "ivy",
					},

					buffers = {
						show_all_buffers = true,
						sort_lastused = true,
						theme = "dropdowm",
						previewer = false,
						mappings = { i = { ["<C-d>"] = actions.delete_buffer } },
					},
				},

				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_order = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
				["ui-select"] = {
					themes.get_dropdown({
						width = 0.5,
						heigth = 0.4,

						border = {},
						previewer = false,
						shorten_path = true,
					}),
				},
				aerial = {
					show_nesting = {
						["_"] = false,
						json = true,
						yaml = true,
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			telescope.load_extension("aerial")

			vim.keymap.set("n", "<leader>as", "<cmd>Telescope aerial<cr>", { desc = "Find Symbols (Aerial)" })
		end,

		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (Files)" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text (Grep)" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help to Neovim" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Last Files" },
			{ "<leader>fn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
			{ "<leader>fc", "<cmd>Telescope find_files cwd=~/dotfiles/nvim<cr>", desc = "Config Neovim" },
		},
	},
}
