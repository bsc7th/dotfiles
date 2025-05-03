return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },

  opts = {
    columns = { "icon" },
    use_default_keymaps = true,
    delete_to_trash = false,
    natural_order = "true", -- Can be true, false, or "fast". "fast" will turn it off for large directories.
    win_options = {
      winbar = "%{v:lua.CustomOilBar()}",
    },
    -- floating progress window
    progress = {
      max_width = 0.9,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      minimized_border = "none",
      win_options = {
        winblend = 0,
      },
    },
    -- floating SSH window
    ssh = {
      border = "rounded",
    },
    -- floating keymaps help window
    keymaps_help = {
      border = "rounded",
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
        return vim.tbl_contains(folder_skip, name)
      end,
    },
  },

  config = function(_, opts)
    CustomOilBar = function()
      local path = vim.fn.expand("%")
      path = path:gsub("oil://", "")
      return "  " .. vim.fn.fnamemodify(path, ":.")
    end

    require("mini.icons").setup()
    require("oil").setup(opts)

    vim.keymap.set("n", "^", function()
      require("oil").open()
    end, { desc = "Open parent directory" })

    vim.keymap.set("n", "<leader>^", function()
      require("oil").toggle_float()
    end, { desc = "Toggle floating Oil" })
  end,
}
