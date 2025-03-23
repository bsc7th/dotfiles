return {
  "brianhuster/live-preview.nvim",
  require("livepreview.config").set({
    port = 3000,
    browser = "default",
    dynamic_root = false,
    picker = "fzf-lua",
    sync_scroll = false,
  }),
}
