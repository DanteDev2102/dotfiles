return {
	"epwalsh/obsidian.nvim",
	version = "*", -- Usa la última versión estable
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/ObsidianVault",
			},
			{
				name = "faiser_soft",
				path = "~/Documents/FaiserSoftNotes",
			},
		},
		notes_subdir = "inbox",
		new_notes_location = "notes_subdir",

		note_id_func = function(title)
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^%w%-_]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,

		ui = {
			enable = true,
		},
	},
	keys = {
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note Obsidian" },
		{ "<leader>oo", "<cmd>ObsidianSearch<cr>", desc = "Find in Obsidian (Telescope)" },
		{ "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert Template" },
		{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "See Backlinks" },
	},
}
