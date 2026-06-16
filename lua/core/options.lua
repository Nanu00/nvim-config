local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	softtabstop = -1,
	wrap = true,
	termguicolors = true,
	number = true,
	relativenumber = true,
	laststatus = 3,
	signcolumn = "yes",
	mouse = "a",
	scrolloff = 8,
	undofile = true,
	ignorecase = true,
	smartcase = true,
	updatetime = 250,
	splitright = true,
	splitbelow = true,
	showmode = false,       -- Don't show mode (lualine shows it)
	linebreak = true,       -- Wrap at word boundaries
	breakindent = true,     -- Preserve indent when wrapping
	timeoutlen = 300,       -- Faster which-key popup
	swapfile = false,       -- no .swp clutter
	backup = false,         -- no ~ files
	inccommand = "nosplit", -- live preview of :s substitution
	pumheight = 10,         -- cap completion menu height
	sidescrolloff = 8,      -- horizontal scroll context (mirrors scrolloff)
}

-- Set options from table
for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Create socket for MCP server integration (silently fails if already in use)
pcall(vim.fn.serverstart, '/tmp/nvim')

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)

-- Fix cursor on exit
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim."
})

-- Set default clipboard to system
vim.opt.clipboard = { 'unnamed', 'unnamedplus' }

