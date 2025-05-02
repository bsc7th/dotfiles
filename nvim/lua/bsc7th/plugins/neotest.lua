return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
  },
  keys = {
    { "<leader>;nt", "<cmd>Neotest run<cr>" },
    { "<leader>;no", "<cmd>Neotest output<cr>" },
    { "<leader>;ns", "<cmd>Neotest summary<cr>" },
    { "<leader>;nl", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-vitest"),
        require("neotest-jest"),
      },
    })
  end,
}
