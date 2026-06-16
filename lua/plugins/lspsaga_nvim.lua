return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        symbol_in_winbar = { enable = true },
        lightbulb = {
            sign = true,
            virtual_text = false,
            sign_priority = 40,
        },
        ui = {
            code_action = "✦",
        },
    },
}
