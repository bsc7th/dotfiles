-- vim-dadbod-ui: A UI for managing databases in Neovim with vim-dadbod
-- This setup provides a powerful and user-friendly interface for SQL/database work

return {
  "kristijanhusak/vim-dadbod-ui", -- Main UI plugin for database interaction
  dependencies = {
    -- Core backend that handles SQL connections and execution
    { "tpope/vim-dadbod", lazy = false }, -- Load immediately since it's required by the UI

    -- Completion source for SQL files (optional but useful)
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql", "graphql" }, -- Enable only for relevant filetypes
      lazy = true, -- Load lazily for performance
    },
  },
  -- Commands that trigger loading of vim-dadbod-ui
  cmd = {
    "DBUI", -- Opens the database UI
    "DBUIToggle", -- Toggles the UI visibility
    "DBUIAddConnection", -- Adds a new database connection
    "DBUIFindBuffer", -- Finds an open DB buffer
  },
  -- Init function to enable nerd fonts (for prettier icons in DBUI)
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
