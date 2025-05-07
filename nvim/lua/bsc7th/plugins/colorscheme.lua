return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  opts = {
    background = "dark",
    transparent = true,
  },
  config = function(_, opts)
    vim.g.gruvbox_italic = 1
    vim.g.gruvbox_italicize_comments = 1
    vim.g.gruvbox_italicize_strings = 1
    vim.g.gruvbox_italicize_keywords = 1
    vim.g.gruvbox_bold = 1

    -- Apply background setting and load colorscheme
    vim.o.background = opts.background
    vim.cmd.colorscheme("gruvbox")

    -- Transparent background setup
    if opts.transparent then
      local hl = vim.api.nvim_set_hl
      hl(0, "Normal", { bg = "none" })
      hl(0, "NormalNC", { bg = "none" })
      hl(0, "NormalFloat", { bg = "none" })
      hl(0, "FloatBorder", { bg = "none" })
      hl(0, "SignColumn", { bg = "none" })
      hl(0, "VertSplit", { bg = "none" })
    end

    -- nvim.notify setup
    local ok, notify = pcall(require, "notify")
    if ok then
      notify.setup({
        background_colour = "#000000",
        fps = 60,
        timeout = 3000,
        max_width = 80,
        max_height = 20,
        merge_duplicates = true,
      })
    end
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
