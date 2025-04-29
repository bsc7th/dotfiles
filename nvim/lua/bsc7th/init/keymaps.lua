local keymap = vim.keymap

-- Insert mode: Use "jk" to exit insert mode (instead of <ESC>)
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Normal mode: Clear search highlights with <leader>ch
keymap.set("n", "<leader>ch", ":nohl<CR>", { desc = "Clear search highlights" })

-- Normal mode: "x" deletes a character without yanking it into the register
keymap.set("n", "x", '"_x')

-- Normal mode: Increment number under cursor with <leader>+
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })

-- Normal mode: Decrement number under cursor with <leader>-
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Normal mode: Split window vertically with <leader>sv
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })

-- Normal mode: Split window horizontally with <leader>sh
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })

-- Normal mode: Make all splits equal size with <leader>se
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- Normal mode: Close the current split with <leader>sx
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Normal mode: Open a new tab with <leader>to
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })

-- Normal mode: Close the current tab with <leader>tx
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })

-- Normal mode: Switch to the next tab with <leader>tn
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })

-- Normal mode: Switch to the previous tab with <leader>tp
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Normal mode: Open current buffer in a new tab with <leader>tf
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
