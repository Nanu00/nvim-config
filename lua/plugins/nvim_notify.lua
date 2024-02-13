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
    config = function ()
	vim.notify = require("notify")
    end
}
