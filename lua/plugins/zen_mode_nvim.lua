return {
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		keys = {
			{ "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen mode" },
		},
		opts = {
			window = {
				backdrop = 1,
				width = 80,
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative numbers
					cursorline = false, -- disable cursorline
					cursorcolumn = false, -- disable cursor column
					foldcolumn = "0", -- disable fold column
					list = false, -- disable whitespace characters
				},
			},
			plugins = {
				kitty = {
					enabled = true,
					font = "+4",
				},
			},
		},
	},
}
