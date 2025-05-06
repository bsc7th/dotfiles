return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      astro = { "prettier", "prettier-plugin-astro" },
      json = { "prettier" },
      yaml = { "prettier" },
      graphql = { "prettier" },
      markdown = { "prettier" },
      liquid = { "prettier" },
      lua = { "stylua" },
      go = { "gofmt", "golines", "shfmt" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
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

    if opts.format_on_save then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
        callback = function()
          conform.format()
        end,
      })
    end
  end,
}
