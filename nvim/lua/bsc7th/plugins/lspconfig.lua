return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "williamboman/mason-lspconfig.nvim" },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    { "ibhagwan/fzf-lua" },
    { "b0o/schemastore.nvim", lazy = true },
  },
  config = function()
    local capabilities = require("blink-cmp").get_lsp_capabilities()

    local function setup_lsp_server(server_name, custom_config)
      local default_config = {
        capabilities = capabilities,
      }
      local config = vim.tbl_deep_extend("force", default_config, custom_config or {})
      require("lspconfig")[server_name].setup(config)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap
        local fzf = require("fzf-lua")

        keymap.set("n", "gR", fzf.lsp_references, vim.tbl_extend("force", opts, { desc = "References" }))
        keymap.set("n", "gd", fzf.lsp_definitions, vim.tbl_extend("force", opts, { desc = "Definitions" }))
        keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Declaration" }))
        keymap.set("n", "gi", fzf.lsp_implementations, vim.tbl_extend("force", opts, { desc = "Implementations" }))
        keymap.set("n", "gt", fzf.lsp_typedefs, vim.tbl_extend("force", opts, { desc = "Type Definitions" }))
        keymap.set(
          { "n", "v" },
          "<leader>ca",
          vim.lsp.buf.code_action,
          vim.tbl_extend("force", opts, { desc = "Code Actions" })
        )
        keymap.set(
          "n",
          "<leader>rn",
          vim.lsp.buf.rename,
          vim.tbl_extend("force", opts, { desc = "Incremental Rename" })
        )
        keymap.set(
          "n",
          "<leader>D",
          fzf.lsp_document_diagnostics,
          vim.tbl_extend("force", opts, { desc = "Document Diagnostics" })
        )
        keymap.set(
          "n",
          "<leader>d",
          vim.diagnostic.open_float,
          vim.tbl_extend("force", opts, { desc = "Line Diagnostics (float)" })
        )
        keymap.set("n", "[d", function()
          vim.diagnostic.goto_prev({ float = true })
        end, vim.tbl_extend("force", opts, { desc = "Previous Error Diagnostic" }))
        keymap.set("n", "]d", function()
          vim.diagnostic.goto_next({ float = true })
        end, vim.tbl_extend("force", opts, { desc = "Next Error Diagnostic" }))
        keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover Documentation" }))
        keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart Server" }))
      end,
    })

    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "astro",
        "svelte",
        "ts_ls",
        "jsonls",
        "graphql",
        "lua_ls",
        "emmet_ls",
      },
      automatic_enable = false,
    })

    require("neodev").setup({
      library = vim.api.nvim_get_runtime_file("", true),
      diagnostics = {
        enable = true,
      },
    })

    -- Manual setup for each server
    setup_lsp_server("astro", {
      filetypes = { "astro", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    })

    setup_lsp_server("svelte", {
      filetypes = { "svelte", "javascript", "typescript" },
    })

    setup_lsp_server("ts_ls", {
      filetypes = { "typescript", "typescriptreact" },
    })

    setup_lsp_server("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    setup_lsp_server("graphql", {
      filetypes = { "graphql", "gql", "javascript", "typescript", "typescriptreact", "javascriptreact" },
    })

    setup_lsp_server("emmet_ls", {
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "scss", "sass", "less" },
    })

    setup_lsp_server("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = {
              "vim",
              "require",
            },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
