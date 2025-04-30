return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Previous Hunk")

      map("n", "<leader>gsh", gs.stage_hunk, "Stage current hunk")
      map("n", "<leader>grh", gs.reset_hunk, "Reset current hunk")

      map("v", "<leader>gst", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage selected hunk")
      map("v", "<leader>grh", function()
        gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset selected hunk")

      map("n", "<leader>gsb", gs.stage_buffer, "Stage entire buffer")
      map("n", "<leader>grb", gs.reset_buffer, "Reset entire buffer")

      map("n", "<leader>guh", gs.undo_stage_hunk, "Undo last staged hunk")
      map("n", "<leader>gph", gs.preview_hunk, "Preview hunk")

      map("n", "<leader>hb", function()
        gs.blame_line({ full = true })
      end, "Full line blame")
      map("n", "<leader>gb", gs.toggle_current_line_blame, "Toggle blame for current line")

      map("n", "<leader>gd", gs.diffthis, "Diff against index")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff against last commit")

      map({ "o", "x" }, "gsh", ":<C-U>Gitsigns select_hunk<CR>", "Select Git hunk")
    end,
  },
}
