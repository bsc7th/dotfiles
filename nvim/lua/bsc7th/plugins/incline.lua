return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local modified = vim.bo[props.buf].modified
        local buffer = {
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
          guibg = "#343a40",
        }
        return buffer
      end,
    })
  end,
}
