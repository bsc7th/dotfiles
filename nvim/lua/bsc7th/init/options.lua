-- Set <Space> as the leader key (used for custom keymaps)
vim.g.mapleader = " "

-- Suppress the intro message when starting Neovim
vim.opt.shortmess:append("I")

-- Show relative line numbers on the left
vim.opt.relativenumber = true

-- Also show the absolute line number for the current line
vim.opt.number = true

-- Number of spaces a <Tab> counts for
vim.opt.tabstop = 2

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Enable auto indentation
vim.opt.autoindent = true

-- Enable smart indentation (based on syntax)
vim.opt.smartindent = true

-- Disable line wrapping (horizontal scroll instead)
vim.opt.wrap = false

-- Ignore case in search patterns...
vim.opt.ignorecase = true

-- ...unless the search pattern contains uppercase letters
vim.opt.smartcase = true

-- Don't highlight the current line
vim.opt.cursorline = false

-- Show global statusline (one statusline for all splits)
vim.opt.laststatus = 3

-- Enable 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- Set background theme to dark (used by some colorschemes)
vim.opt.background = "dark"

-- Always show the sign column (e.g., for git/linter icons)
vim.opt.signcolumn = "yes"

-- Make backspace behave like in other editors
vim.opt.backspace = "indent,eol,start"

-- Use system clipboard for all yank/paste operations
vim.opt.clipboard:append("unnamedplus")

-- New vertical splits open to the right
vim.opt.splitright = true

-- New horizontal splits open below
vim.opt.splitbelow = true

-- Disable backup files (you're using Git anyway, right?)
vim.opt.backup = false

-- Show command in bottom bar as you type
vim.opt.showcmd = true

-- Set the command line height (conditionally overridden below)
vim.opt.cmdheight = 1

-- Keep 10 lines above/below cursor while scrolling
vim.opt.scrolloff = 10

-- Use Zsh as the shell for Neovim terminal commands
vim.opt.shell = "zsh"

-- Highlight matches while searching
vim.opt.hlsearch = true

-- Keep the cursor position fixed when splitting
vim.opt.splitkeep = "cursor"

-- Disable mouse support
vim.opt.mouse = ""

-- Don’t create swap files (disable crash recovery files)
vim.opt.swapfile = false

-- Neovim 0.8+ supports cmdheight=0 (hide cmd bar unless needed)
vim.opt.cmdheight = vim.fn.has("nvim-0.8") == 1 and 0 or 1

-- Auto-insert comment leader when pressing Enter in insert mode
vim.opt.formatoptions:append({ "r" })

-- LazyVim-specific: Tell prettier it needs a config file
vim.g.lazyvim_prettier_needs_config = true

-- LazyVim: Use fzf-lua as the fuzzy picker plugin
vim.g.lazyvim_picker = "fzf-lua"

-- LazyVim: Use blink.cmp as the completion engine
vim.g.lazyvim_cmp = "blink.cmp"

-- Set filetype to Astro for .astro files (for syntax highlighting etc.)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.astro",
  command = "setfiletype astro",
})
