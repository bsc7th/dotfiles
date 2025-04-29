return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true,
      ts_config = {
        markdown = { "strong", "emph" },
        html = { "tag" },
        lua = { "string" },
        javascript = { "template_string" },
        typescript = { "template_string" },
        go = { "string" },
        python = { "string" },
        java = false,
      },
      dissable_filetypes = { "text" },
      check_bracket_line = true,
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    local cmp = require("cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
