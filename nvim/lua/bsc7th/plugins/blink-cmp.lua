return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",

      {
        "echasnovski/mini.snippets",
        config = function()
          require("mini.snippets").setup({
            snippets = { preset = "mini_snippets" },
            sources = {
              default = { "lsp", "path", "snippets", "buffer" },
            },
          })
        end,
      },

      {
        "saghen/blink.compat",
        optional = true,
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
    },
    opts = {
      keymap = { preset = "default" },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      signature = { enabled = true },
    },
  },
}
