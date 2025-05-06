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
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Info = " ",
        Hint = " ",
      },
      git = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    vim.o.laststatus = vim.g.lualine_laststatus

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
        lualine_b = { "branch" },
        lualine_c = {
          get_pretty_path,
          {
            "diagnostics",
            symbols = icons.diagnostics,
          },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
        },
        lualine_x = {
          function()
            local ok, noice = pcall(require, "noice")
            return ok and noice.api.status.command.has() and noice.api.status.command.get() or ""
          end,
          function()
            local ok, noice = pcall(require, "noice")
            return ok and noice.api.status.mode.has() and noice.api.status.mode.get() or ""
          end,
          function()
            local ok, dap = pcall(require, "dap")
            return ok and dap.status() ~= "" and ("  " .. dap.status()) or ""
          end,
          {
            function()
              local lazy = require("lazy.status")
              return lazy.has_updates() and lazy.updates() or ""
            end,
            cond = function()
              return require("lazy.status").has_updates()
            end,
            color = function()
              return { fg = "#FFD700" }
            end,
          },
          {
            "diff",
            symbols = icons.git,
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          function()
            local ok, neotest = pcall(require, "neotest")
            if not ok then
              return ""
            end
            local status = neotest.status.summary()
            if status.running then
              return " running"
            elseif status.failed > 0 then
              return " " .. status.failed .. " failed"
            elseif status.passed > 0 then
              return " " .. status.passed .. " passed"
            else
              return ""
            end
          end,
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }

    if vim.g.trouble_lualine then
      local ok, trouble = pcall(require, "trouble")
      if ok then
        local symbols = trouble.statusline
          and trouble.statusline({
            mode = "symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal",
          })
        if symbols then
          table.insert(opts.sections.lualine_c, {
            symbols.get,
            cond = function()
              return vim.b.trouble_lualine ~= false and symbols.has()
            end,
          })
        end
      end
    end

    -- Gruvbox original mode colors
    local gruvbox_custom = {
      normal = {
        a = { fg = "#1d2021", bg = "#d79921", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      insert = {
        a = { fg = "#1d2021", bg = "#b16286", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      visual = {
        a = { fg = "#1d2021", bg = "#98971a", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      replace = {
        a = { fg = "#1d2021", bg = "#689d6a", gui = "bold" },
        b = { fg = "#ebdbb2", bg = "#3c3836" },
        c = { fg = "#ebdbb2", bg = "#282828" },
      },
      inactive = {
        a = { fg = "#a89984", bg = "#7c6f6f4", gui = "bold" },
        b = { fg = "#a89984", bg = "#1d2021" },
        c = { fg = "#a89984", bg = "#1d2021" },
      },
    }

    opts.options.theme = gruvbox_custom

    return opts
  end,
}
