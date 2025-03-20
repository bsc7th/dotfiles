return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	opts = {
		window = { backdrop = 0.75 },
		plugins = {
			gitsigns = true,
			tmux = true,
			wezterm = { enabled = false, font = "+2" },
		},
	},
	keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
