local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<C-s>", ":w<CR>", { desc = "Save file" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file" })

map("n", "<Esc>", ":nohlsearch<CR>", opts)

map("n", "<leader>wv", ":vsplit<CR>", { desc = "Split Y" })
map("n", "<leader>wh", ":split<CR>", { desc = "Split X" })

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprev<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Close Buffer" })

map("n", "<leader>as", "<cmd>Telescope aerial<cr>", { desc = "Find Symbols (Aerial)" })
