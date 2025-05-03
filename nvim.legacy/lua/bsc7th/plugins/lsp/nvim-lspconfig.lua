return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local capabilities = require("blink-cmp").get_lsp_capabilities()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local keymap = vim.keymap

    local function setup_lsp_server(server_name, opts)
      opts = opts or {}
      opts.capabilities = capabilities
      lspconfig[server_name].setup(opts)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        keymap.set("n", "[d", function()
          local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          if #diagnostics > 0 then
            vim.diagnostic.goto({ severity = "prev" })({ float = true })
          else
            print("No previous diagnostics")
          end
        end, opts)
        keymap.set("n", "]d", function()
          local diagnostics = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          if #diagnostics > 0 then
            vim.diagnostic.goto({ severity = "next" })({ float = true })
          else
            print("No next diagnostics")
          end
        end, opts)
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    mason_lspconfig.setup_handlers({
      function(server_name)
        setup_lsp_server(server_name)
      end,

      ["graphql"] = function()
        setup_lsp_server("graphql", {
          filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
        })
      end,

      ["emmet_ls"] = function()
        setup_lsp_server("emmet_ls", {
          filetypes = {
            "html", "typescriptreact", "javascriptreact",
            "css", "sass", "scss", "less",
          },
        })
      end,

      ["lua_ls"] = function()
        setup_lsp_server("lua_ls", {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              completion = { callSnippet = "Replace" },
            },
          },
        })
      end,
    })
  end,
}
