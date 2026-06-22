return {
	{
		"echasnovski/mini.files",
		config = function()
			require("mini.files").setup({
				options = {
					permanent_delete = false,
				},
				windows = {
					preview = true,
				},
			})
			require("helpers.keys").map(
				{ "n", "v" },
				"<leader>e",
				function()
					if not MiniFiles.close() then
						MiniFiles.open(vim.api.nvim_buf_get_name(0))
					end
				end,
				"Toggle file explorer"
			)
		end,
	},
}
