return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  event = "VeryLazy",
  opts = {
    terminal_cmd = vim.fn.expand("/usr/bin/claude"),
    diff_opts = {
      open_in_new_tab = true,
    },
  },
  config = true,
  keys = {
    { "<leader>z",  nil,                              desc = "AI/Claude Code" },
    { "<leader>zc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>zf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>zr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>zC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>zm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>zb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
    { "<leader>zs", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send to Claude" },
    {
      "<leader>zs",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management
    { "<leader>za", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>zd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
  },
}
