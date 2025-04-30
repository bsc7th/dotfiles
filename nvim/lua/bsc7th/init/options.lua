vim.g.mapleader = " "
vim.opt.shortmess:append("I")
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = false
vim.opt.laststatus = 0
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.hlsearch = true
vim.opt.splitkeep = "cursor"
vim.opt.mouse = ""
vim.opt.swapfile = false
vim.opt.cmdheight = vim.fn.has("nvim-0.8") == 1 and 0 or 1
vim.opt.formatoptions:append({ "r" })
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "fzf-lua"

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.cmd("set t_ZH=[3m")
vim.cmd("set t_ZR=[23m")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.astro",
  command = "setfiletype astro",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.svelte",
  command = "setfiletype svelte",
})
