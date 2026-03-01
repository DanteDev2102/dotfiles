local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = false
opt.ruler = false
opt.wrap = false
opt.fillchars = {
	eob = " ",
	fold = " ",
	vert = "│",
}

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.confirm = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.updatetime = 250
opt.timeoutlen = 300
opt.lazyredraw = false

opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false

opt.laststatus = 3
opt.splitbelow = true
opt.splitright = true

opt.shortmess:append("sI")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
