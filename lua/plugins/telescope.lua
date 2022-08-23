local map = require'cartographer'

local actions    = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin    = require('telescope.builtin')
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case'
        },
        layout_config = {
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = false,
          },
          prompt_position = "bottom",
        },
        file_sorter      = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix    = '  ',
        color_devicons   = true,

        sorting_strategy = "ascending",

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
            },
            n = {
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
            }
        }
    },
    extensions = {
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')

map.n.nore['<leader>ta'] = "<cmd>lua require'telescope.builtin'.builtin{}<cr>"
map.n.nore['<leader>tt'] = "<cmd>lua require'telescope.builtin'.treesitter{}<cr>"
map.n.nore['<leader>tl'] = "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>"
map.n.nore['<leader>tb'] = "<cmd>lua require'telescope.builtin'.buffers{}<cr>"
map.n.nore['<Tab>'] = "<cmd>lua require'telescope.builtin'.buffers{}<cr>"
map.n.nore['<leader>tr'] = "<cmd>lua require'telescope.builtin'.registers{}<cr>"
map.n.nore['<leader>tq'] = "<cmd>lua require'telescope.builtin'.quickfix{}<cr>"
map.n.nore['<leader>t/'] = "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<cr>"
map.n.nore['<leader>tf'] = "<cmd>lua require'telescope.builtin'.find_files{}<cr>"
map.n.nore['<leader>tc'] = "<cmd>lua require'telescope.builtin'.commands{}<cr>"
map.n.nore['<leader>tp'] = "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>"

-- Implement delta as previewer for diffs

local M = {}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry)
    return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' }
  end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

M.edit_neovim = function()
  builtin.git_files {
    cwd = "~/.config/nvim",
    prompt = "~ dotfiles ~",
    color_devicons   = true,
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
      prompt_position = "top",
    },
  }
end

return M


