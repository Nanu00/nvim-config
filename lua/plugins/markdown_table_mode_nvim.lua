-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/Kicamon/markdown-table-mode.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "Kicamon/markdown-table-mode.nvim",
  config = function()
    require('markdown-table-mode').setup()
  end
}
