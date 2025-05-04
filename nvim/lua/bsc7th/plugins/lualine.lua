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
          statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
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
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { get_pretty_path },
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
          -- Lazy updates
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
          -- Git diff
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
          -- Neotest status
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
          -- LSP clients
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then
              return " No LSP"
            end
            local names = {}
            for _, client in ipairs(clients) do
              table.insert(names, client.name)
            end
            return " " .. table.concat(names, ", ")
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
        local symbols = trouble.statusline({
          mode = "symbols",
          groups = {},
          title = false,
          filter = { range = true },
          format = "{kind_icon}{symbol.name:Normal}",
          hl_group = "lualine_c_normal",
        })
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = function()
            return vim.b.trouble_lualine ~= false and symbols.has()
          end,
        })
      end
    end

    return opts
  end,
}
