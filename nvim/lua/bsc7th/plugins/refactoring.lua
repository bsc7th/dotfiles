return {
  "ThePrimeagen/refactoring.nvim",
  event = "BufRead",
  opts = {
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor({
            show_success_message = true,
          })
        end,
        mode = "v",
        desc = "Refactor",
      },
    },
  },
}
