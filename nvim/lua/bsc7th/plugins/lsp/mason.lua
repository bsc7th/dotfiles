return {
  "williamboman/mason.nvim", -- Mason plugin: Manages external tools for Neovim (like LSP servers and formatters)
  dependencies = {
    "williamboman/mason-lspconfig.nvim", -- LSP config integration for Mason
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Installer for external tools via Mason
  },
  config = function()
    local mason = require("mason") -- Load Mason for managing tools
    local mason_lspconfig = require("mason-lspconfig") -- Load LSP config setup for Mason
    local mason_tool_installer = require("mason-tool-installer") -- Load tool installer for Mason

    -- Mason setup with custom icons for package status
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓", -- Indicates an installed package
          package_pending = "➜", -- Indicates a pending package installation
          package_uninstalled = "✗", -- Indicates an uninstalled package
        },
      },
    })

    -- Set up LSP servers to be automatically installed via Mason
    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "ts_ls",
        "astro",
        "svelte",
        "emmet_ls",
        "pyright",
        "graphql",
        "prismals",
      },
      automatic_installation = true, -- Automatically installs LSP servers if not already installed
    })

    -- Set up tool installer to automatically install specific tools
    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "eslint_d",
        "stylua",
        "pylint",
        "black",
        "isort",
      },
    })
  end,
}
