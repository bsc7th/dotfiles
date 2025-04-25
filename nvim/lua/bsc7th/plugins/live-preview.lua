return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  config = function()
    local map = vim.api.nvim_set_keymap
    map("n", "<leader>lp", "<cmd>LivePreview start<cr>", { noremap = true, silent = true })
    map("n", "<leader>lP", "<cmd>LivePreview close<cr>", { noremap = true, silent = true })

    require("livepreview.config").set({
      port = 3000,
    })
  end,
}
