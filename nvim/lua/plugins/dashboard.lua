return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = function()
		local logo = [[
      ███████╗ █████╗ ██╗███████╗███████╗██████╗     ███████╗ ██████╗ ███████╗████████╗
      ██╔════╝██╔══██╗██║██╔════╝██╔════╝██╔══██╗    ██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
      █████╗  ███████║██║███████╗█████╗  ██████╔╝    ███████╗██║   ██║█████╗     ██║   
      ██╔══╝  ██╔══██║██║╚════██║██╔══╝  ██╔══██╗    ╚════██║██║   ██║██╔══╝     ██║   
      ██║     ██║  ██║██║███████║███████╗██║  ██║    ███████║╚██████╔╝██║        ██║   
      ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝ ╚═╝        ╚═╝   
    ]]

		local opts = {
			theme = "hyper",
			config = {
				header = vim.split(logo, "\n"),
				shortcut = {
					{
						desc = "󰩉 Proyectos Recientes",
						group = "@variable",
						action = "Telescope oldfiles",
						key = "r",
					},
					{
						desc = "󰩟 Abrir Podploy (Go)",
						group = "@function",
						action = "cd ~/projects/podploy | Telescope find_files",
						key = "p",
					},
					{
						desc = "󱘗 Abrir RWYRD (Rust)",
						group = "@constant",
						action = "cd ~/projects/rwyrd | Telescope find_files",
						key = "w",
					},
					{
						desc = "󰱒 Buscar en archivos",
						group = "@label",
						action = "Telescope live_grep",
						key = "g",
					},
					{
						desc = "󱔗 Configuración Dotfiles",
						group = "@property",
						action = "cd ~/.config/nvim | Telescope find_files",
						key = "c",
					},
				},
				footer = { "Software Architect | Faiser Soft C.A." },
			},
		}

		for _, button in ipairs(opts.config.shortcut) do
			button.desc = button.desc .. string.rep(" ", 30 - #button.desc)
		end

		return opts
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
