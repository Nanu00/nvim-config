-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/https://git.sr.ht/~whynothugo/lsp_lines.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup()
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = {only_current_line = true},
		})
	end
}
