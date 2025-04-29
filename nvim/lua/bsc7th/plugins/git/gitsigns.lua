return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy-load plugin when a buffer is read or a new file is created
  opts = {
    -- Custom signs for Git changes in the sign column
    signs = {
      add = { text = "▎" }, -- Line added
      change = { text = "▎" }, -- Line changed
      delete = { text = "" }, -- Line deleted
      topdelete = { text = "" }, -- Top-line deleted
      changedelete = { text = "▎" }, -- Line changed and deleted
      untracked = { text = "▎" }, -- New untracked file
    },
    -- Signs shown for staged changes
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      -- Helper to define buffer-local keymaps with descriptions
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation between hunks
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Previous Hunk")

      -- Stage and reset hunks
      map("n", "<leader>gsh", gs.stage_hunk, "Stage current hunk")
      map("n", "<leader>grh", gs.reset_hunk, "Reset current hunk")

      -- Stage and reset selected lines in visual mode
      map("v", "<leader>gst", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage selected hunk")
      map("v", "<leader>grh", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset selected hunk")

      -- Stage or reset the entire buffer
      map("n", "<leader>gsb", gs.stage_buffer, "Stage entire buffer")
      map("n", "<leader>grb", gs.reset_buffer, "Reset entire buffer")

      -- Undo the last staged hunk
      map("n", "<leader>guh", gs.undo_stage_hunk, "Undo last staged hunk")

      -- Preview the current hunk inline
      map("n", "<leader>gph", gs.preview_hunk, "Preview hunk")

      -- Git blame
      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Full line blame")
      map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle blame for current line")

      -- Git diff
      map("n", "<leader>gd", gs.diffthis, "Diff against index")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff against last commit")

      -- Select a hunk in operator-pending or visual mode (useful for mappings like `d` or `y`)
      map({ "o", "x" }, "gsh", ":<C-U>Gitsigns select_hunk<CR>", "Select Git hunk")
    end,
  },
}
