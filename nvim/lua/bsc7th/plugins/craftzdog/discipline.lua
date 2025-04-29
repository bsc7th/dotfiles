local M = {}

function M.cowboy()
  ---@type boolean
  local ok = true
  for _, key in ipairs({ "h", "j", "k", "l", "<Left>", "<Down>", "<Up>", "<Right>" }) do
    local count = 0
    local timer = assert(vim.uv.new_timer())
    local map = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= 3 and vim.bo.buftype ~= "nofile" then
        ok = pcall(vim.notify, "💬 Lakad matatag!", vim.log.levels.WARN, {
          -- NOTE: Embedded emoji directly in the message since the default vim.notify doesn't support 'icon' without a plugin like nvim-notify.
          -- If you're using nvim-notify, you can uncomment 'icon' and 'id' below to enable richer notifications.
          -- icon = "💬",
          -- id = "cowboy",
          keep = function()
            return count >= 3
          end,
        })
        if not ok then
          return map
        end
      else
        count = count + 1
        timer:start(5000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

return M
