return {
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    config = function()
      require("render-markdown").setup({
        html = { enabled = false },
        latex = { enabled = false },
      })
    end,
  },
}
