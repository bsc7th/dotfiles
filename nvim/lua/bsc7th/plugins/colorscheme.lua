return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  opts = {
    background = "soft",
    foreground = "material",
    enable_italic = true,
    enable_bold = true,
    transparent_background = true,
  },
  config = function(_, opts)
    vim.g.gruvbox_material_background = opts.background
    vim.g.gruvbox_material_foreground = opts.foreground
    vim.g.gruvbox_material_enable_italic = opts.enable_italic and 1 or 0
    vim.g.gruvbox_material_enable_bold = opts.enable_bold and 1 or 0
    vim.g.gruvbox_material_transparent_background = opts.transparent_background and 1 or 0

    vim.cmd.colorscheme("gruvbox-material")
  end,
}

-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     use_background = "dark",
--     border = "rounded",
--     enable_italics = true,
--     style = "dark",
--     transparent = true,
--     terminal_colors = true,
--     styles = {
--       boolean = { bold = true },
--       comments = { bold = true },
--       conditionals = { italic = true },
--       functions = { bold = true },
--       keywords = { bold = true },
--       loops = { italic = true },
--       misc = { italic = true },
--       numbers = { bold = true },
--       operators = { bold = true },
--       properties = { italic = true },
--       string = { bold = false },
--       types = { italic = true },
--       underline = true,
--       undercurl = true,
--       variables = { italic = true },
--     },
--   },
--   config = function(_, opts)
--     require("solarized-osaka").setup(opts)
--     vim.cmd.colorscheme("solarized-osaka")
--   end,
-- }
