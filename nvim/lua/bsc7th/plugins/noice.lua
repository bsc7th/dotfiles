return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.routes = opts.routes or {}

    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
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

    opts.commands = {
      all = {
        view = "split",
        opts = { enter = true, format = "details" },
        filter = {},
      },
    }

    opts.presets = opts.presets or {}
    opts.presets.lsp_doc_border = true

    opts.lsp = opts.lsp or {}
    opts.lsp.override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    }
  end,
}
