-- General Neovim keymaps
require("core.keymaps")

-- Handle plugins with lazy.nvim
if not vim.g.vscode then
    require("core.lazy")
end

-- Other options
require("core.options")
