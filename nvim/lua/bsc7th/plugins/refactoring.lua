return {
  "ThePrimeagen/refactoring.nvim",
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
