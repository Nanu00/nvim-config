local dap = require('dap')
local map = require('cartographer')

-- dap.adapters.codelldb = function(on_adapter)
--   local stdout = vim.loop.new_pipe(false)
--   local stderr = vim.loop.new_pipe(false)
--
--   -- CHANGE THIS!
--   local cmd =  '/home/shantanu/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/adapter/codelldb'
--
--   local handle, pid_or_err
--   local opts = {
--     stdio = {nil, stdout, stderr},
--     detached = true,
--     args = { '--params', '\'{"showDissassembly":"never"}\'' },
--   }
--   handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
--     stdout:close()
--     stderr:close()
--     handle:close()
--     if code ~= 0 then
--       print("codelldb exited with code", code)
--     end
--   end)
--   assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       local port = chunk:match('Listening on port (%d+)')
--       if port then
--         vim.schedule(function()
--           on_adapter({
--             type = 'server',
--             host = '127.0.0.1',
--             port = port
--           })
--         end)
--       else
--         vim.schedule(function()
--           require("dap.repl").append(chunk)
--         end)
--       end
--     end
--   end)
--   stderr:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
-- end
--
-- dap.defaults.fallback.external_terminal = {
--     command = 'usr/bin/alacritty',
--     args = {'-e'},
-- }
--
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "codelldb",
--         request = 'launch',
--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', 'file')
--         end,
--         -- file = function()
--         --     return vim.fn.input("Path to source: ", vim.fn.getcwd() .. '/', 'file')
--         -- end,
--         cwd = '${workspaceFolder}',
--         stopOnEntry = true,
--     },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

map.n.nore.silent["<leader>dc"] = "<cmd>lua require'dap'.continue()<cr>"
map.n.nore.silent["<leader>db"] = "<cmd>lua require'dap'.toggle_breakpoint()<cr>"
map.n.nore.silent["<leader>ds"] = "<cmd>lua require'dap'.step_over()<cr>"
map.n.nore.silent["<leader>dn"] = "<cmd>lua require'dap'.step_into()<cr>"
map.n.nore.silent["<leader>dr"] = "<cmd>lua require'dap'.repl.open()<cr>"
