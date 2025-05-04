return {
  "williamboman/mason.nvim",
  -- NOTE: Lazy-loaded: tools won't auto-install. Run :Mason and install manually, or remove (event = "VeryLazy") line to auto-install on startup.
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
          -- NOTE: Disable unnecessary logs/UI in mason.setup()
          check_outdated_packages_on_open = false,
        },
        border = "none",
      },
      log_level = vim.log.levels.WARN,
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "lua_ls",
        "ts_ls",
        "emmet_ls",
        "graphql",
        "prismals",
        "gopls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "eslint_d",
        "stylua",
        "shfmt",
      },
      automatic_installation = true,
    })
  end,
}
