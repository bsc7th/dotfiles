return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      graphql = { "prettier" },
      markdown = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      go = { "gofmt", "golines" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
  config = function(_, opts)
    local ok, conform = pcall(require, "conform")
    if not ok then
      vim.notify("conform.nvim failed to load!", vim.log.levels.ERROR)
      return
    end

    conform.setup(opts)

    vim.keymap.set({ "n", "v" }, "<leader>pf", function()
      conform.format({
        lsp_fallback = true,
        async = true,
        quiet = false,
        timeout_ms = 3000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
