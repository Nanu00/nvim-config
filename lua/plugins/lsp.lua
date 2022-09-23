local map = require('cartographer')
local lspconfig = require('lspconfig')

require("mason-lspconfig").setup_handlers {
    function (server_name)
       lspconfig[server_name].setup {}
   end,
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- local border = {
--       {"╭", "FloatBorder"},
--       {"─", "FloatBorder"},
--       {"╮", "FloatBorder"},
--       {"│", "FloatBorder"},
--       {"╯", "FloatBorder"},
--       {"─", "FloatBorder"},
--       {"╰", "FloatBorder"},
--       {"│", "FloatBorder"},
-- }

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
map.n.nore.silent['Q'] = "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>"
