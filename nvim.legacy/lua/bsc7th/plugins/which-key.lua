return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
        vim.o.timeout = true
        vim.o.timeoutlen = 500
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
