return {
  "morhetz/gruvbox",
  lazy = false,
  priority = 1000,
  opts = {
    background = "dark",
    transparent = true,
  },
  config = function(_, opts)
    vim.o.background = opts.background
    vim.cmd.colorscheme("gruvbox")

    if opts.transparent then
      local hl = vim.api.nvim_set_hl
      hl(0, "Normal", { bg = "none" })
      hl(0, "NormalNC", { bg = "none" })
      hl(0, "NormalFloat", { bg = "none" })
      hl(0, "FloatBorder", { bg = "none" })
      hl(0, "SignColumn", { bg = "none" })
      hl(0, "VertSplit", { bg = "none" })
    end

    -- If you're using notify.nvim and want to set its background too
    local ok, notify = pcall(require, "notify")
    if ok then
      notify.setup({
        background_colour = "#000000",
        fps = 60, -- Can adjust as needed
        timeout = 3000, -- Notification timeout in milliseconds
        max_width = 80, -- Adjust the max width if necessary
        max_height = 20, -- Adjust the max height if necessary
        -- Add merge_duplicates to avoid duplicate notifications
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
