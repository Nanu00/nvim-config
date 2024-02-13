-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/kevinhwang91/nvim-hlslens
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
    "kevinhwang91/nvim-hlslens",
	config = function ()
		require("hlslens").setup();
		local kopts = {noremap = true, silent = true}

		vim.api.nvim_set_keymap('n', 'n',
			[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts)
		vim.api.nvim_set_keymap('n', 'N',
			[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
			kopts)
		vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
		vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

		vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
	end
}
