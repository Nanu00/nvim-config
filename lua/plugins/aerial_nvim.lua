-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/stevearc/aerial.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

local map = require("helpers.keys").map

return {
	'stevearc/aerial.nvim',
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("aerial").setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end
		})

		map("n", "<leader>a", "<cmd>AerialToggle!<CR>", "Toggle Aerial")
	end
}
