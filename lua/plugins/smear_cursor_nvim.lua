-- No example configuration was found for this plugin.
--
-- For detailed information on configuring this plugin, please refer to its
-- official documentation:
--
--   https://github.com/sphamba/smear-cursor.nvim
--
-- If you wish to use this plugin, you can optionally modify and then uncomment
-- the configuration below.

return {
  "sphamba/smear-cursor.nvim",
  opts = {
    smear_insert_mode = false,
    time_interval = 10,
    stiffness = 0.9,
    trailing_stiffness = 0.4,
    anticipation = 0.1,
    particles_enabled = true,
    never_draw_over_target = true
  },
}
