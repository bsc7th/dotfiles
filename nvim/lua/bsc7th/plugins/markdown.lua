return {
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    config = function()
      require("render-markdown").setup({
        latex = { enabled = false },
        html = { enabled = false },
      })
    end,
  },
}
