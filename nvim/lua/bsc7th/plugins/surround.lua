return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  -- event = { "BufReadPre", "BufNewFile" },
  version = "*",
  -- version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      keymaps = {
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
      },
    })
  end,
}
