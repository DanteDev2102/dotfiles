return {
  "folke/twilight.nvim",
  opts = {
    dimming = {
      alpha = 0.25,
    },
    context = 10, 
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
  },
  keys = {
    { "<leader>tw", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
  },
}
