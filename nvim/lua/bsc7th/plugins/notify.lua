return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 5000,
    stages = "fade",
    on_open = function()
      local border_color = "#98971a"
      local levels = {
        ERROR = "#fb4934",
        WARN = "#fabd2f",
        INFO = "#83a598",
        DEBUG = "#928374",
        TRACE = "#d3869b",
      }

      for level, color in pairs(levels) do
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Icon", { fg = color })
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Title", { fg = color })
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Border", { fg = border_color })
        vim.api.nvim_set_hl(0, "Notify" .. level .. "Body", { link = "Normal" })
      end
    end,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
    vim.cmd("doautocmd ColorScheme")
  end,
}
