return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme solarized-osaka]])

    require("solarized-osaka").setup({
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
    })
  end,
}

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "auto", -- latte, frappe, macchiato, mocha
--       background = { -- :h background
--         light = "latte",
--         dark = "mocha",
--       },
--       transparent_background = true, -- disables setting the background color.
--       show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--       term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
--       dim_inactive = {
--         enabled = false, -- dims the background color of inactive window
--         shade = "dark",
--         percentage = 0.15, -- percentage of the shade to apply to the inactive window
--       },
--       no_italic = false, -- Force no italic
--       no_bold = false, -- Force no bold
--       no_underline = false, -- Force no underline
--       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--         comments = { "italic" }, -- Change the style of comments
--         conditionals = { "italic" },
--         loops = { "italic" },
--         functions = { "bold" },
--         keywords = { "bold" },
--         strings = { "italic" },
--         variables = { "bold" },
--         numbers = { "bold" },
--         booleans = { "italic" },
--         properties = { "italic" },
--         types = { "italic" },
--         operators = { "bold" },
--         -- miscs = {}, -- Uncomment to turn off hard-coded styles
--       },
--       color_overrides = {},
--       custom_highlights = {},
--       default_integrations = true,
--       integrations = {
--         cmp = true,
--         gitsigns = true,
--         nvimtree = true,
--         treesitter = true,
--         notify = false,
--         mini = {
--           enabled = true,
--           indentscope_color = "",
--         },
--         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--       },
--     })
--
--     -- setup must be called before loading
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }
