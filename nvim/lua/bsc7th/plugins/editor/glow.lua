return {
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    cmd = "Glow",
    config = function()
      require("glow").setup({
        border = "rounded",
        style = "dark",
        keymaps = {
          quit = "<Esc>",
        },
        glow = {
          width = 100,
          height = 100,
          wrap = "on",
          lines = 10,
        },
      })
    end,
  },
}
