-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme solarized-osaka]])
--
--     require("solarized-osaka").setup({
--       use_background = "dark",
--       border = "rounded",
--       enable_italics = true,
--       style = "dark",
--       transparent = true,
--       terminal_colors = true,
--       styles = {
--         boolean = { bold = true },
--         comments = { bold = true },
--         conditionals = { italic = true },
--         functions = { bold = true },
--         keywords = { bold = true },
--         loops = { italic = true },
--         misc = { italic = true },
--         numbers = { bold = true },
--         operators = { bold = true },
--         properties = { italic = true },
--         string = { bold = false },
--         types = { italic = true },
--         underline = true,
--         undercurl = true,
--         variables = { italic = true },
--       },
--     })
--   end,
-- }

return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = { style = "moon" },
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true,
      border = "rounded",
      use_background = "dark",
      enable_italics = true,
      terminal_colors = true,
      styles = {
        boolean = { bold = true },
        loops = { italic = true },
        operators = { bold = true },
        numbers = { bold = true },
        functions = { bold = true },
        keywords = { bold = true },
        strings = { bold = true },
        comments = { italic = true },
        types = { italic = true },
        variables = { italic = true },
        underline = true,
        undercurl = true,
      },
    })
    vim.cmd("colorscheme tokyonight")
  end,
}
