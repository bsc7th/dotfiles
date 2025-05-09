return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local function get_pretty_path()
      return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
    end

    local opts = {
      options = {
        theme = "auto",
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = {},
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {
          get_pretty_path,
          {
            "diagnostics",
            symbols = {
              Error = " ",
              Warn = " ",
              Info = " ",
              Hint = " ",
            },
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
        },
        lualine_x = {},
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {},
      },
      extensions = { "fzf" },
    }

    local gruvbox = {
      normal = {
        a = { fg = "#1d2021", bg = "#98971a", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      insert = {
        a = { fg = "#1d2021", bg = "#b16286", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      visual = {
        a = { fg = "#1d2021", bg = "#689d6a", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      replace = {
        a = { fg = "#1d2021", bg = "#d79921", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      inactive = {
        a = { fg = "#a89984", bg = "#7c6f6f4", gui = "bold" },
        b = { fg = "#a89984", bg = "#1d2021" },
        c = { fg = "#a89984", bg = "#1d2021" },
      },
    }

    opts.options.theme = gruvbox

    return opts
  end,
}
