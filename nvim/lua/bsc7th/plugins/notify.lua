return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 5000,
    stages = "fade_in_slide_out",
  },
  init = function()
    vim.notify = require("notify")
  end,
}
