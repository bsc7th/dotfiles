return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "echasnovski/mini.icons", "echasnovski/mini.fuzzy" },
  keys = {
    {
      "<leader>fc",
      function()
        require("fzf-lua").commands()
      end,
      desc = "search commands",
    },
    {
      "<leader>fch",
      function()
        require("fzf-lua").command_history()
      end,
      desc = "search command history",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "search old files",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").highlights()
      end,
      desc = "search highlights",
    },
    {
      "<leader>fM",
      function()
        require("fzf-lua").marks()
      end,
      desc = "search marks",
    },
    {
      "<leader>fk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "search keymaps",
    },
    {
      "<leader>flg",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "live grep",
    },
    {
      "<leader>fgf",
      function()
        require("fzf-lua").git_files()
      end,
      desc = "search git file names",
    },
    {
      "<leader>fgb",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "search git branches",
    },
    {
      "<leader>fgc",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "search git commits",
    },
    {
      "<leader>fgC",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "search git buffer commits",
    },
    {
      "<leader>fr",
      function()
        require("fzf-lua").resume()
      end,
      desc = "resume fzf",
    },
  },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      keymap = {
        fzf = {
          ["CTRL-Q"] = "select-all+accept",
        },
      },

      fzf_opts = { ["--wrap"] = true },
      winopts = {
        preview = {
          wrap = "wrap",
        },
        formatter = "path.filename_first",
      },
    })
    local function fzf_directories(opts)
      local fzf_lua = require("fzf-lua")
      local fzf_path = require("fzf-lua.path")
      opts = opts or {}

      local cwd = vim.fn.getcwd()
      opts.prompt = fzf_path.shorten(cwd) .. "> "
      opts.cwd = cwd

      -- opts.fn_transform = function(x)
      --   return fzf_lua.utils.ansi_codes.magenta(x)
      -- end

      opts.actions = {
        ["default"] = function(selected)
          vim.cmd("Oil --float " .. cwd .. "/" .. selected[1])
        end,
      }

      fzf_lua.fzf_exec("fd --type d", opts)
    end

    vim.api.nvim_create_user_command("FzfDirectories", function()
      fzf_directories({})
    end, {})
  end,
}
