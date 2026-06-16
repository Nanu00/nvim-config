return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()

			wk.add({
				{ "<leader>b", group = "Buffer" },
				{ "<leader>f", group = "File" },
				{ "<leader>w", group = "Window" },
				{ "<leader>q", group = "Quit" },
				{ "<leader>s", group = "Search" },
				{ "<leader>c", group = "Code (LSP)" },
				{ "<leader>u", group = "UI" },
				{ "<leader>g", group = "Git" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>M", group = "Mason" },
			})
		end
	}
}
