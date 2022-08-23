local dap = require('dap')
local map = require('cartographer')

map.n.nore.silent["<leader>dc"] = "<cmd>lua require'dap'.continue()<cr>"
map.n.nore.silent["<leader>db"] = "<cmd>lua require'dap'.toggle_breakpoint()<cr>"
map.n.nore.silent["<leader>ds"] = "<cmd>lua require'dap'.step_over()<cr>"
map.n.nore.silent["<leader>dn"] = "<cmd>lua require'dap'.step_into()<cr>"
map.n.nore.silent["<leader>dr"] = "<cmd>lua require'dap'.repl.open()<cr>"
