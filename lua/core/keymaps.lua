local keys = require("helpers.keys")
local map = keys.map

-- Set leader before all keymaps
keys.set_leader(" ")

-- Blazingly fast way out of insert mode
map("i", "jk", "<esc>")

-- Quick access to some common actions
map("n", "<leader>fn", "<cmd>enew<cr>", "New file")
map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")

-- Diagnostic keymaps
map('n', 'gx', vim.diagnostic.open_float, "Show diagnostics under cursor")

-- Easier access to beginning and end of lines
map("n", "<M-h>", "^", "Go to beginning of line")
map("n", "<M-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Buffer management
local buffers = require("helpers.buffers")
map("n", "<leader>bd", buffers.delete_this, "Delete buffer")
map("n", "<leader>bo", buffers.delete_others, "Delete others")
map("n", "<leader>ba", buffers.delete_all, "Delete all")
map("n", "<leader>bn", "<cmd>bnext<cr>", "Next buffer")
map("n", "<leader>bp", "<cmd>bprevious<cr>", "Prev buffer")

-- Navigate buffers (fast)
map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")

-- Window management
map("n", "<leader>wd", "<cmd>close<cr>", "Close window")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
map("n", "<leader>ut", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, "Toggle between light and dark themes")

-- Clear after search
map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- LSP Saga Keybinds
map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", "Code actions")
map("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", "Line diagnostics")
map("n", "<leader>cr", "<cmd>Lspsaga rename<cr>", "Rename symbol")
map("n", "<leader>ck", "<cmd>Lspsaga peek_definition<cr>", "Peek definition")
map("n", "<leader>co", "<cmd>Lspsaga outline<cr>", "Code outline")
map("n", "<leader>cD", "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Workspace diagnostics")
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", "Incoming calls")
map("n", "<leader>cO", "<cmd>Lspsaga outgoing_calls<cr>", "Outgoing calls")

-- LSP Saga Navigation (g-prefix, overrides neovim builtins intentionally)
map("n", "<leader>lf", function() vim.lsp.buf.format() end, "Format buffer")
map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", "Goto definition")
map("n", "gD", "<cmd>Lspsaga goto_type_definition<cr>", "Goto type definition")
map("n", "gr", "<cmd>Lspsaga finder<cr>", "Find references")
map("n", "K", "<cmd>Lspsaga hover_doc<cr>", "Hover doc")

-- LSP Saga Diagnostic Jumping
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next diagnostic")
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev diagnostic")
map("n", "]e", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, "Next error")
map("n", "[e", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, "Prev error")

-- Terminal Keybinds
map("t", "<C-Esc>", "<C-\\><C-n>", "Switch to normal mode")
map("t", "<Esc><Esc>", "<C-\\><C-n>", "Switch to normal mode")
map("t", "<C-w>", "<C-\\><C-n><C-w>", "Window movement")
