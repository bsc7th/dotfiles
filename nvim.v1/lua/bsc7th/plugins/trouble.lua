return {
  "folke/trouble.nvim",
  dependencies = { "folke/todo-comments.nvim" },
  opts = {
    focus = true,
  },
  cmd = "Trouble",
  keys = {
    { ";xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open workspace diagnostics" },
    {
      ";xd",
      "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
      desc = "Open document diagnostics",
    },
    { ";xf", "<cmd>Trouble quickfix toggle<CR>", desc = "Open quickfix list" },
    { ";xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open location list" },
    { ";xt", "<cmd>Trouble todo toggle<CR>", desc = "Open TODOs in Trouble" },
  },
}
