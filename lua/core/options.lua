local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	softtabstop = -1,
	wrap = true,
	termguicolors = true,
	number = true,
	relativenumber = false,
	laststatus = 3,
	signcolumn = "yes",
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
