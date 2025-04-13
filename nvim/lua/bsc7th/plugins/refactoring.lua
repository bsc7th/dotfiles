return {
  "ThePrimeagen/refactoring.nvim",
  keys = {
    {
      "<leader>rf",
      function()
        require("refactoring").select_refactor({
          show_success_message = true,
        })
      end,
      mode = "v",
      noremap = true,
      silent = true,
      expr = false,
    },
  },
  opts = {},
}
