-- M is a table to store functions
local M = {}

-- Function cowboy() listens to specific key presses
-- The keys being listened to are "h", "j", "k", "l", and the arrow keys (Left, Down, Up, Right)
-- If a key is pressed more than 10 times, a notification "Lakad matatag!" will appear with a cowboy emoji 🤠
-- The notification will keep appearing as long as the key continues to be pressed 10 times and will be removed
-- if the key press count is reduced below 3. This is handled with a timer that resets the count after 2 seconds.

function M.cowboy()
  ---@type boolean
  local ok = true
  -- Loop through each key to set up the keymap
  for _, key in ipairs({ "h", "j", "k", "l", "<Left>", "<Down>", "<Up>", "<Right>" }) do
    local count = 0
    local timer = assert(vim.uv.new_timer())  -- Create a timer to reset the count after 2 seconds
    local map = key
    -- Set the keymap for each key
    vim.keymap.set("n", key, function()
      -- Reset the count if a count is specified (vim.v.count)
      if vim.v.count > 0 then
        count = 0
      end
      -- Check if the count reaches 10, then trigger the notification
      if count >= 10 and vim.bo.buftype ~= "nofile" then
        ok = pcall(vim.notify, "Lakad matatag!", vim.log.levels.WARN, {
          icon = "🤠",  -- Cowboy emoji as an icon
          id = "cowboy",  -- Unique ID for the notification
          keep = function()
            return count >= 3  -- Keep the notification if the count is above 3
          end,
        })
        -- If there is an error with pcall, return the key map
        if not ok then
          return map
        end
      else
        count = count + 1  -- Increment the count each time the key is pressed
        timer:start(2000, 0, function()
          count = 0  -- Reset the count after 2 seconds
        end)
        return map
      end
    end, { expr = true, silent = true })  -- Silent keymap and use expression
  end
end

-- Return the module with the cowboy function
return M