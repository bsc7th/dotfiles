return {
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons", "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>fc",
        function()
          require("fzf-lua").commands()
        end,
        desc = "Search commands",
      },
      {
        "<leader>fch",
        function()
          require("fzf-lua").command_history()
        end,
        desc = "Search command history",
      },

      {
        "<leader>ff",
        function()
          require("fzf-lua").files()
        end,
        desc = "Search files",
      },
      {
        "<leader>fh",
        function()
          require("fzf-lua").highlights()
        end,
        desc = "Search highlights",
      },
      {
        "<leader>fM",
        function()
          require("fzf-lua").marks()
        end,
        desc = "Search marks",
      },
      {
        "<leader>fk",
        function()
          require("fzf-lua").keymaps()
        end,
        desc = "Search keymaps",
      },

      {
        "<leader>flg",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "Live grep",
      },
      {
        "<leader>fgf",
        function()
          require("fzf-lua").git_files()
        end,
        desc = "Search git files",
      },
      {
        "<leader>fgb",
        function()
          require("fzf-lua").git_branches()
        end,
        desc = "Search git branches",
      },
      {
        "<leader>fgc",
        function()
          require("fzf-lua").git_commits()
        end,
        desc = "Search git commits",
      },
      {
        "<leader>fgC",
        function()
          require("fzf-lua").git_bcommits()
        end,
        desc = "Search buffer git commits",
      },

      {
        "<leader>fr",
        function()
          require("fzf-lua").resume()
        end,
        desc = "Resume previous search",
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

      vim.api.nvim_create_user_command("FzfGitFiles", function()
        fzf.fzf_exec("git ls-files", { prompt = "Git Files > " })
      end, {})
    end,
  },
}
