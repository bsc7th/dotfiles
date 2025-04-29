return {
  "kdheepak/lazygit.nvim", -- Plugin that integrates LazyGit (a terminal UI for Git) into Neovim
  cmd = {
    "LazyGit", -- Opens LazyGit UI
    "LazyGitConfig", -- Opens LazyGit with Git config view
    "LazyGitCurrentFile", -- LazyGit focused on the current file
    "LazyGitFilter", -- Filter commits in LazyGit
    "LazyGitFilterCurrentFile", -- Filter commits of the current file
  },
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency that provides Lua utility functions
  },
  keys = {
    {
      "<leader>lg",
      "<cmd>LazyGit<cr>",
      desc = "Open lazy git", -- Keybinding to open LazyGit with <leader>lg
    },
  },
}
