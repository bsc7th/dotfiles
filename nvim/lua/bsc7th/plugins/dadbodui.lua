return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql", "graphql" },
      lazy = true,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  opts = {
    db_ui_use_nerd_fonts = 1,
  },
  config = function(_, opts)
    for k, v in pairs(opts) do
      vim.g[k] = v
    end
  end,
}
