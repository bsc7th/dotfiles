-- Enable vim.loader early if it's available
if vim.loader then
  vim.loader.enable()
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "bsc7th.plugins" },
  { import = "bsc7th.plugins.lsp" },
  { import = "bsc7th.plugins.git" },
}, {
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})

require("bsc7th.plugins.util.debug")
_G.dd = function(...)
  require("bsc7th.plugins.util.debug").dump(...)
end
vim.print = _G.dd

require("bsc7th.plugins.craftzdog.discipline").cowboy()
