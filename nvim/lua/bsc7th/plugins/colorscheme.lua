return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    use_background = "dark",
    border = "rounded",
    enable_italics = true,
    style = "dark",
    transparent = true,
    terminal_colors = true,
    styles = {
      boolean = { bold = true },
      comments = { bold = true },
      conditionals = { italic = true },
      functions = { bold = true },
      keywords = { bold = true },
      loops = { italic = true },
      misc = { italic = true },
      numbers = { bold = true },
      operators = { bold = true },
      properties = { italic = true },
      string = { bold = false },
      types = { italic = true },
      underline = true,
      undercurl = true,
      variables = { italic = true },
    },
  },
  config = function(_, opts)
    require("solarized-osaka").setup(opts)
    vim.cmd.colorscheme("solarized-osaka")
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "night",
--     transparent = true,
--     lualine_bold = true,
--     use_background = "dark",
--     terminal_colors = true,
--     dim_inactive = true,
--     cache = true,
--     light_style = "day",
--     day_brightness = 0.1,
--     plugins = {},
--     styles = {
--       comments = { italic = true },
--       keywords = { bold = true },
--       functions = { bold = true },
--       variables = { italic = true },
--       strings = { bold = true },
--       numbers = { bold = true },
--       operators = { bold = true },
--       types = { italic = true },
--       conditionals = { italic = true },
--       loops = { italic = true },
--       booleans = { bold = true },
--     },
--     on_colors = function(colors)
--       colors.border = "#565f89"
--     end,
--     on_highlights = function(highlights, colors)
--       highlights.Comment = { fg = colors.comment, italic = true }
--       highlights.Function = { fg = colors.blue, bold = true }
--     end,
--   },
--   config = function(_, opts)
--     require("tokyonight").setup(opts)
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }
