-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd([[colorscheme solarized-osaka]])

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

-- Load and configure TokyoNight colorscheme
return {
  "folke/tokyonight.nvim",
  lazy = false, -- Load immediately (not lazy-loaded)
  opts = { style = "moon" }, -- Set the style to "moon" (can be "storm", "night", "day", etc.)
  priority = 1000, -- Make sure it's loaded early (high priority)

  config = function()
    -- Setup TokyoNight with custom settings
    require("tokyonight").setup({
      transparent = true, -- Enable transparent background
      border = "rounded", -- Use rounded borders for floating windows
      use_background = "dark", -- Use dark background variant
      enable_italics = true, -- Enable italic font style
      terminal_colors = true, -- Apply colors to terminal as well
      
      styles = {
        -- Style settings for different syntax groups
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

        -- Global underline and undercurl settings
        underline = true,
        undercurl = true,
      },
    })

    -- Apply the colorscheme
    vim.cmd("colorscheme tokyonight")
  end,
}