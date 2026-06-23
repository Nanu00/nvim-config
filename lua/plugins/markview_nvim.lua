return {
	"OXY2DEV/markview.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	ft = { "markdown", "quarto", "rmd" },
	keys = {
		{ "<leader>um", "<cmd>Markview Toggle<cr>", desc = "Toggle Markview" },
		{ "<leader>uM", "<cmd>Markview HybridToggle<cr>", desc = "Toggle Markview hybrid" },
		{
			"<leader>ux",
			function()
				local line = vim.api.nvim_get_current_line()
				local new_line
				if line:match("%- %[x%]") then
					new_line = line:gsub("%- %[x%]", "- [ ]", 1)
				elseif line:match("%- %[ %]") then
					new_line = line:gsub("%- %[ %]", "- [x]", 1)
				end
				if new_line then
					vim.api.nvim_set_current_line(new_line)
				end
			end,
			desc = "Toggle checkbox",
			ft = "markdown",
		},
	},
	opts = {
		preview = {
			modes = { "n", "no", "c" },
			hybrid_modes = { "n" },
			debounce = 150,
			icon_provider = "devicons",
		},
		markdown = {
			checkboxes = {
				enable = true,
				checked   = { text = "󰗠", hl = "MarkviewCheckboxChecked" },
				unchecked = { text = "󰄰", hl = "MarkviewCheckboxUnchecked" },
				["/"]     = { text = "󱎖", hl = "MarkviewCheckboxPending" },
				[">"]     = { text = "", hl = "MarkviewCheckboxCancelled" },
				["-"]     = { text = "󰍶", hl = "MarkviewCheckboxCancelled",
				              scope_hl = "MarkviewCheckboxStriked" },
			},
		},
	},
}
