return {
  {
    "saghen/blink.cmp", -- Blink.cmp: A modern completion plugin built with performance in mind
    version = "1.*", -- Locks to the latest v1.x.x version for stability
    dependencies = {
      "rafamadriz/friendly-snippets", -- Predefined snippets for various languages

      {
        "echasnovski/mini.snippets", -- Minimal snippet engine
        config = function()
          require("mini.snippets").setup({
            snippets = { preset = "mini_snippets" }, -- Use MiniSnippets' built-in snippet presets
            sources = {
              default = { "lsp", "path", "snippets", "buffer" }, -- Sources for autocompletion
            },
          })
        end,
      },

      {
        "saghen/blink.compat", -- Compatibility layer for Blink, optional for extended support
        optional = true, -- Will load only if available
        opts = {}, -- No extra options needed here
        version = vim.g.lazyvim_blink_main and "*" or "1.*", -- Use "*" if using main branch, fallback to v1.x
      },
    },
    opts = {
      keymap = { preset = "default" }, -- Default key mappings for completion behavior

      appearance = {
        use_nvim_cmp_as_default = true, -- Allows Blink to integrate with nvim-cmp UI styling
        nerd_font_variant = "mono", -- Use monospaced Nerd Font symbols for a cleaner UI
      },

      signature = { enabled = true }, -- Enable function signature help on completion

      fuzzy = {
        implementation = "prefer_rust_with_warning", -- Use Rust implementation if possible, fallback to Lua with a warning
        -- Rust gives better performance, typo tolerance, and sorting for large completion lists
      },
    },
  },
}
