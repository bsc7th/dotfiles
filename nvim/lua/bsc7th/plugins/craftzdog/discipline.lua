local M = {}

--[[
  🤠 Cowboy Mode:
  Tracks rapid movement key presses (h, j, k, l, arrow keys) in normal mode.
  
  If a user presses any movement key more than 10 times quickly (within 2 seconds per key),
  and the current buffer is a regular file (not a special 'nofile' buffer), 
  a playful "Lakad Matatag!" notification appears to encourage perseverance.
  
  Notes:
  - After 2 seconds of inactivity, the keypress counter resets.
  - Works silently without disrupting normal movement commands.
  - Adds a fun cowboy emoji and warning level on notification.
  
  This module is purely for fun and motivation, inspired by the Dota 2 meme. 🐎
]]

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
      if count >= 10 and vim.bo.buftype ~= "nofile" then
        ok = pcall(vim.notify, "Lakad matatag!", vim.log.levels.WARN, {
          icon = "🤠",
          id = "cowboy",
          keep = function()
            return count >= 3
          end,
        })
        if not ok then
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end
end

return M
