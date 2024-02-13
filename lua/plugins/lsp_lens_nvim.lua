-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/VidocqH/lsp-lens.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
    "VidocqH/lsp-lens.nvim",
    config = function()
        require'lsp-lens'.setup({
            sections = {
                definition = true,
                references = true,
                implements = true,
                git_authors = false
            }
        })
    end
}
