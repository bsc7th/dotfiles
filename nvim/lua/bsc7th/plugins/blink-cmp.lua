return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- {
      --   "echasnovski/mini.snippets",
      --   config = function()
      --     require("mini.snippets").setup({
      --       snippets = { preset = "mini_snippets" },
      --       sources = {
      --         default = { "lsp", "path", "snippets", "buffer" },
      --       },
      --     })
      --   end,
      -- },
      {
        "saghen/blink.compat",
        optional = true,
        opts = {},
        version = vim.g.lazyvim_blink_main and "*" or "1.*",
      },
    },
    opts = {
      keymap = {
        preset = "enter",
        ["<CR>"] = { "select_and_accept" },
        ["<Tab>"] = { "select_next" },
        ["<S-Tab>"] = { "select_prev" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      signature = { enabled = true },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
}
