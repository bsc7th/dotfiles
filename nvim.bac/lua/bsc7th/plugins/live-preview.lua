return {
  "brianhuster/live-preview.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  config = function()
    local map = vim.api.nvim_set_keymap
    -- Set your key mappings for live preview
    map("n", "<leader>lp", "<cmd>LivePreview start<cr>", { noremap = true, silent = true })
    map("n", "<leader>lP", "<cmd>LivePreview close<cr>", { noremap = true, silent = true })

    -- Set port for live preview
    require("livepreview.config").set({
      port = 3000, -- specify the port number here
    })
  end,
}
