local map = require('cartographer')
local lspconfig = require('lspconfig')
local configs = require("lspconfig.configs")

if not configs.xtensaclangd then
    configs.xtensaclangd = {
        default_config = {
            cmd = {'$HOME/.espressif/tools/xtensa-clang/14.0.0-38679f0333/xtensa-esp32-elf-clang/bin/clangd'},
            filetypes = {},
            -- root_dir = lspconfig.util.root_pattern('sdkconfig'),
            -- root_dir = function(fname)
            --     return lspconfig.util.find_git_ancestor(fname) or
            --     vim.loop.os_homedir()
            -- end,
            settings = {}
        }
    }
end

require("mason-lspconfig").setup_handlers {
    function (server_name)
        if (server_name ~= "rust_analyzer") then
            lspconfig[server_name].setup {}
        end
   end,
}

lspconfig.xtensaclangd.setup {
}

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
kinds[i] = icons[kind] or kind
end

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
map.n.nore.silent['<leader>cd'] = '<cmd>lua vim.lsp.buf.definition()<CR>'
map.n.nore.silent['<leader>ca'] = "<cmd>lua vim.lsp.buf.code_action()<CR>"

map.n.nore.silent['Q'] = "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>"
map.n.nore.silent['K'] = "<cmd>lua vim.lsp.buf.hover()<CR>"

map.n.nore.silent['<leader>cr'] = "<cmd>lua vim.lsp.buf.rename()<CR>"
