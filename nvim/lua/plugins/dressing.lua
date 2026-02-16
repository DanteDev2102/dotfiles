return {
	"stevearc/dressing.nvim",
	opts = {
		input = {
			enabled = true,
			default_prompt = "➤ ",
			win_options = {
				winhighlight = "Normal:Normal,NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		select = {
			enabled = true,
			backend = { "telescope", "fzf_lua", "builtin" },
		},
	},
}
