return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    {
      "folke/neodev.nvim",
      opts = {
        library = vim.api.nvim_get_runtime_file("", true),
        diagnostics = { enable = true },
      },
    },
    "ibhagwan/fzf-lua",
    { "b0o/schemastore.nvim", lazy = true },
  },
  opts = function()
    local capabilities = require("blink-cmp").get_lsp_capabilities()
    local fzf = require("fzf-lua")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end

        map("n", "gR", fzf.lsp_references, "References")
        map("n", "gd", fzf.lsp_definitions, "Definitions")
        map("n", "gD", vim.lsp.buf.declaration, "Declaration")
        map("n", "gi", fzf.lsp_implementations, "Implementations")
        map("n", "gt", fzf.lsp_typedefs, "Type Definitions")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        map("n", "<leader>D", fzf.lsp_document_diagnostics, "Document Diagnostics")
        map("n", "<leader>d", vim.diagnostic.open_float, "Line Diagnostics")
        map("n", "[d", function()
          vim.diagnostic.goto_prev({ float = true })
        end, "Previous Diagnostic")
        map("n", "]d", function()
          vim.diagnostic.goto_next({ float = true })
        end, "Next Diagnostic")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
      end,
    })

    local servers = {
      astro = {
        filetypes = { "astro", "javascript", "typescript", "javascriptreact", "typescriptreact" },
      },
      svelte = {
        filetypes = { "svelte", "javascript", "typescript" },
      },
      ts_ls = {
        filetypes = { "typescript", "typescriptreact" },
      },
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      emmet_ls = {
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
          "css",
          "scss",
          "sass",
          "less",
        },
      },
      graphql = {
        filetypes = {
          "graphql",
          "gql",
          "javascript",
          "typescript",
          "typescriptreact",
          "javascriptreact",
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim", "require" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      },
    }

    return {
      capabilities = capabilities,
      servers = servers,
    }
  end,

  config = function(_, opts)
    local lspconfig = require("lspconfig")

    for name, server_opts in pairs(opts.servers) do
      lspconfig[name].setup(vim.tbl_deep_extend("force", {
        capabilities = opts.capabilities,
      }, server_opts))
    end
  end,
}
