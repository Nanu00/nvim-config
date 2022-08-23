local saga = require('lspsaga')
local map = require('cartographer')

saga.init_lsp_saga()

map.n.nore.silent['<leader>cdj'] = '<cmd>lua vim.lsp.buf.definition()<CR>'
map.n.nore.silent['<leader>cdp'] = "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>"
map.n.nore.silent['<leader>ca'] = "<cmd>lua require('lspsaga.codeaction').range_code_action()<CR>"
map.v.nore.silent['<leader>ca'] = ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>"

map.n.nore.silent['K'] = "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>"
map.n.nore.silent['<C-f>'] = "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"
map.n.nore.silent['<C-b>'] = "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"

map.n.nore.silent['<leader>cr'] = "<cmd>lua require('lspsaga.rename').rename()<CR>"
