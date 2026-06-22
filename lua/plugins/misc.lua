-- Miscelaneous fun stuff
return {
	-- Comment with haste
	{
		"numToStr/Comment.nvim",
	},
	-- Move stuff with <M-j> and <M-k> in both normal and visual mode
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
	-- Better buffer closing actions. Available via the buffers helper.
	{
		"kazhala/close-buffers.nvim",
	},
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	-- Surround stuff: sa (add), sd (delete), sr (replace)
	{
		"echasnovski/mini.surround",
		config = function()
			require("mini.surround").setup()
		end,
	},
}
