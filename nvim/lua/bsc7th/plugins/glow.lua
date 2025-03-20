return {
	{
		"ellisonleao/glow.nvim",
		ft = "markdown",
		cmd = "Glow",
		config = function()
			require("glow").setup({
				border = "rounded",
				style = "dark",
				keymaps = {
					quit = "<Esc>",
					toggle_fullscreen = "<F11>",
				},
				glow = {
					width = 80,
					height = 30,
					wrap = "on",
					lines = 10,
				},
			})
		end,
	},
}
