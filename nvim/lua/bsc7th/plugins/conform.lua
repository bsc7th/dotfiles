-- Conform.nvim: A lightweight formatter plugin for Neovim
-- Automatically formats code on save and allows manual formatting with a keymap.
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Load plugin early for formatting on file open/new
  config = function()
    -- Safely require the conform plugin to avoid breaking if it's missing
    local ok, conform = pcall(require, "conform")
    if not ok then
      return
    end

    -- Setup conform with filetype-specific formatters
    conform.setup({
      formatters_by_ft = {
        markdown = { "prettier" }, -- Use Prettier for markdown
        html = { "prettier" }, -- Prettier for HTML
        css = { "prettier" }, -- Prettier for CSS
        lua = { "stylua" }, -- Stylua for Lua
        javascript = { "prettier" }, -- Prettier for JS
        typescript = { "prettier" }, -- Prettier for TS
        javascriptreact = { "prettier" }, -- Prettier for React (JSX)
        typescriptreact = { "prettier" }, -- Prettier for TSX
        svelte = { "prettier" }, -- Prettier for Svelte
        json = { "prettier" }, -- Prettier for JSON
        yaml = { "prettier" }, -- Prettier for YAML
        python = { "isort", "black" }, -- isort & black for Python
        graphql = { "prettier" }, -- Prettier for GraphQL
        liquid = { "prettier" }, -- Prettier for Liquid templates
      },
      -- Automatically format on save with fallback to LSP formatting if needed
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- Keybinding to manually format file or selected range (visual mode)
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
