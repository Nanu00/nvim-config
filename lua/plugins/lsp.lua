-- LSP Configuration & Plugins
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
            },
            "folke/neodev.nvim",
            "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
            "jubnzv/virtual-types.nvim",
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "clangd",
                },
                automatic_installation = true,
            })

            -- Quick access via keymap
            require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

            -- Neodev setup before LSP config
            require("neodev").setup()

            -- Turn on LSP status information
            require("fidget").setup()

            -- Diagnostic config (Neovim 0.10+ API)
            vim.diagnostic.config({
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "✖",
                        [vim.diagnostic.severity.WARN] = "‼",
                        [vim.diagnostic.severity.HINT] = "⚑",
                        [vim.diagnostic.severity.INFO] = "○",
                    },
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Broadcast capabilities to all servers
            vim.lsp.config("*", { capabilities = capabilities })

            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.lsp.enable({ "lua_ls", "pyright", "clangd" })

        end,
    },
}
