-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/rcarriga/nvim-notify
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
    "rcarriga/nvim-notify",
    dependencies = { "catppuccin/nvim" },
    config = function()
        local palette = require("catppuccin.palettes").get_palette()
        require("notify").setup({
            background_colour = palette.base,
        })
        vim.notify = require("notify")
    end
}
