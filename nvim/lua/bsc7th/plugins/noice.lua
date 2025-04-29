return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = function(_, opts)
    opts.lsp = opts.lsp or {}
    opts.lsp.override = vim.tbl_deep_extend("force", opts.lsp.override or {}, {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    })

    opts.routes = opts.routes or {}
    vim.list_extend(opts.routes, {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
    })

    local focused = true
    vim.api.nvim_create_autocmd("FocusGained", {
      callback = function()
        focused = true
      end,
    })
    vim.api.nvim_create_autocmd("FocusLost", {
      callback = function()
        focused = false
      end,
    })
    table.insert(opts.routes, {
      filter = {
        cond = function()
          return not focused
        end,
      },
      view = "notify_send",
      opts = { stop = false },
    })

    opts.presets = vim.tbl_deep_extend("force", opts.presets or {}, {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    })

    require("noice").setup(opts)
  end,

  keys = {
    { "<leader>n", desc = "+noice" },

    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c",
      desc = "Redirect Cmdline",
    },

    {
      "<leader>nl",
      function()
        require("noice").cmd("last")
      end,
      desc = "Noice Last Message",
    },

    {
      "<leader>nh",
      function()
        require("noice").cmd("history")
      end,
      desc = "Noice History",
    },

    {
      "<leader>na",
      function()
        require("noice").cmd("all")
      end,
      desc = "Noice All",
    },

    {
      "<leader>nd",
      function()
        require("noice").cmd("dismiss")
      end,
      desc = "Dismiss All",
    },

    {
      "<leader>np",
      function()
        require("noice").cmd("pick")
      end,
      desc = "Noice Picker (Telescope/FzfLua)",
    },

    {
      "<C-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<C-f>"
        end
      end,
      mode = { "i", "n", "s" },
      silent = true,
      expr = true,
      desc = "Scroll Forward",
    },

    {
      "<C-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<C-b>"
        end
      end,
      mode = { "i", "n", "s" },
      silent = true,
      expr = true,
      desc = "Scroll Backward",
    },
  },
}
