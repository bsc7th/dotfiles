return {
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    cmd = "Glow",
    config = function()
      require("glow").setup({
        glow_path = "",
        install_path = vim.fn.stdpath("data") .. "/glow",
        pager = false,
        width = 200,
        height = 200,
        border = "rounded",
        style = "dark",
        keymaps = {
          quit = "<Esc>",
        },
        glow = {
          width = 200,
          height = 200,
          wrap = "on",
          lines = 12,
        },
      })
    end,
  },
}
