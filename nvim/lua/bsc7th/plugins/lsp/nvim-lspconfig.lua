return {
  "neovim/nvim-lspconfig", -- This is the main plugin that sets up Neovim's built-in LSP support
  event = { "BufReadPre", "BufNewFile" }, -- Load this plugin early when opening or creating a file
  dependencies = {
    "saghen/blink.cmp", -- Custom completion source that integrates with LSP (used instead of nvim-cmp)
    { "antosha417/nvim-lsp-file-operations", config = true }, -- Automatically handles LSP file renames/moves
    { "folke/neodev.nvim", opts = {} }, -- Provides improved Lua development experience for Neovim config
  },
  config = function()
    -- This sets up the capabilities that LSP clients will use for completion
    local capabilities = require("blink-cmp").get_lsp_capabilities()

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local keymap = vim.keymap

    -- Set up LSP-related keymaps once the language server attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- LSP keymaps — helpful tools for navigation and refactoring
        opts.desc = "Show LSP references (find all usages)"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Go to definition"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Go to implementation"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Go to type definition"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "Open code actions (fixes, refactors)"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Rename symbol under cursor"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show diagnostics for the current buffer"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show diagnostics for the current line"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Jump to previous error diagnostic"
        keymap.set("n", "[d", function()
          local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          if #diagnostics > 0 then
            vim.diagnostic.goto({ severity = "prev" })({ float = true })
          else
            print("No previous diagnostics")
          end
        end, opts)

        opts.desc = "Jump to next error diagnostic"
        keymap.set("n", "]d", function()
          local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          if #diagnostics > 0 then
            vim.diagnostic.goto({ severity = "next" })({ float = true })
          else
            print("No next diagnostics")
          end
        end, opts)

        opts.desc = "Show documentation (hover info)"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP server manually"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- Use mason-lspconfig to set up language servers
    mason_lspconfig.setup_handlers({
      -- Default setup for most LSPs
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      -- Custom LSP setup for Svelte
      ["svelte"] = function()
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          ---@diagnostic disable-next-line: unused-local
          on_attach = function(client, bufnr)
            -- Notify the Svelte LSP when JS/TS files are saved
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
          filetypes = { "svelte", "html", "javascript", "typescript" },
        })
      end,

      -- Enable GraphQL support in frontend files
      ["graphql"] = function()
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact", "svelte" },
        })
      end,

      -- Emmet setup for HTML & CSS-like files (expand shortcuts like `ul>li*3`)
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = {
            "html", "typescriptreact", "javascriptreact",
            "css", "sass", "scss", "less", "svelte"
          },
        })
      end,

      -- Lua language server configuration for editing your Neovim config
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }, -- Avoid undefined global warning for `vim`
              },
              completion = {
                callSnippet = "Replace", -- Improves auto-completion behavior
              },
            },
          },
        })
      end,
    })
  end,
}
