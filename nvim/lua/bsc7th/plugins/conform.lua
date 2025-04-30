return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local ok, conform = pcall(require, "conform")
    if not ok then
      return
    end

    conform.setup({
      formatters_by_ft = {
        markdown = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        python = { "isort", "black" },
        graphql = { "prettier" },
        liquid = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

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
