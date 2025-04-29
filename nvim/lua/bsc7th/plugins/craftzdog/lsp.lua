local M = {}
local LazyvimUtil = require("util.debug")

function M.toggleInlayHints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.toggleAutoformat()
  LazyvimUtil.format.toggle()
end

return M
