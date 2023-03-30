local execute = vim.api.nvim_command

-- check if packer is installed (~/.local/share/nvim/site/pack)
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = install_path .. "/plugin/packer_compiled.lua"
local is_installed = vim.fn.empty(vim.fn.glob(install_path)) == 0

if not is_installed then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
    print("Installed packer.nvim.")
    is_installed = 1
end

-- Packer commands
vim.cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
vim.cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
vim.cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
vim.cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
vim.cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]
vim.cmd [[command! PC PackerCompile]]
vim.cmd [[command! PS PackerStatus]]
vim.cmd [[command! PU PackerSync]]

local packer = nil
if not is_installed then return end
if packer == nil then
    packer = require('packer')
    packer.init({
        -- we don't want the compilation file in '~/.config/nvim'
        compile_path = compile_path
    })
end

local use = packer.use

---------
-- Packer
---------
use 'wbthomason/packer.nvim'

---------------------
-- Early loaded stuff
---------------------
use {'lewis6991/impatient.nvim'}
use {'nvim-lua/plenary.nvim'}
use {'nathom/filetype.nvim'}
use {'kyazdani42/nvim-web-devicons'}

-- Theme(s)
-- use 'olimorris/onedarkpro.nvim'
-- use "rafamadriz/neon"
use {'navarasu/onedark.nvim', config = function() require('plugins.onedark') end}

------------
-- LSP stuff
------------
-- Server installer
use {'williamboman/mason.nvim', config = function() require('plugins.mason') end}
use {'williamboman/mason-lspconfig.nvim', config = function() require('plugins.mason-lspconfig') end}

-- LSP configuration
use {'neovim/nvim-lspconfig', config = function() require('plugins.lsp') end}


-- UI
use {'nvim-lua/lsp-status.nvim'}
use {'nvim-lua/popup.nvim'}
-- use {'tami5/lspsaga.nvim', config = function() require('plugins.saga') end}
use {'SmiteshP/nvim-gps', config = function() require('plugins.gps') end, after = 'nvim-treesitter'}
use {'jose-elias-alvarez/nvim-lsp-ts-utils', after = {'nvim-treesitter'}}
use {'folke/lsp-trouble.nvim', config = function() require('plugins.trouble') end}
use {'rcarriga/nvim-notify', config = function() require('plugins.notify') end}

-- Completion
-- use {'ms-jpq/coq_nvim', branch = 'coq', as = 'coq', config = function() require('plugins.coq') end}
-- use {'ms-jpq/coq.artifacts', branch = 'artifacts', after = 'coq'}
-- use {'ms-jpq/coq.thirdparty', branch = '3p', requires = 'coq', config = function() require('plugins.coq_3p') end}
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-buffer'}
use {'hrsh7th/cmp-path'}
use {'hrsh7th/cmp-calc'}
use {'hrsh7th/cmp-cmdline'}
-- use {'quangnguyen30192/cmp-nvim-ultisnips', config = function() require('plugins.cmp-ultisnips') end}
use {'saadparwaiz1/cmp_luasnip'}
use {'onsails/lspkind-nvim', config = function() require('plugins.lspkind') end}
use {'ray-x/cmp-treesitter'}
use {'hrsh7th/nvim-cmp', config = function() require('plugins.cmp') end}
use {'jose-elias-alvarez/null-ls.nvim', config = function() require('plugins.null-ls') end, requires = {'nvim-lua/plenary.nvim'}}

-------------
-- Treesitter
-------------
use {'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'}
use {'nvim-treesitter/nvim-treesitter-textobjects', after = {'nvim-treesitter'}}
use {'RRethy/nvim-treesitter-textsubjects', after = {'nvim-treesitter'}}

------------
-- Telescope
------------
use {'nvim-telescope/telescope.nvim',
    config = function() require('plugins.telescope') end,
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim'}
    }
  }
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

----------------------
-- Language and Syntax
----------------------
use {'windwp/nvim-autopairs', after = {'nvim-treesitter'}, config = function() require('plugins.autopairs') end}
use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end}
use {'lukas-reineke/indent-blankline.nvim', config = function() require('plugins.indent-blankline') end}
use {'mfussenegger/nvim-dap', config = function() require('plugins.dap') end}
use {'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"}, config = function() require('plugins.dap-ui') end}
use {'simrat39/rust-tools.nvim', config = function() require('plugins.rust-tools') end}
use {'elkowar/yuck.vim'}
use {'eraserhd/parinfer-rust', run = "make install && cargo build --release && cargo install"}
use {'p00f/clangd_extensions.nvim', config = function() require('plugins.clangd_extensions') end }
-- use {'lewis6991/hover.nvim', confug = function() require('plugins.hover') end}

------------
-- Others
------------
use {'lervag/vimtex'}
use {'ahmedkhalf/project.nvim', config = function() require('plugins.project') end}
use {'ur4ltz/surround.nvim', config = function() require('plugins.surround') end}
use {'nacro90/numb.nvim', config = function() require('plugins.numb') end}
use {'akinsho/nvim-toggleterm.lua', config = function() require('plugins.toggleterm') end}
use {'numToStr/Comment.nvim', config = function() require('plugins.comment') end}
use {'folke/twilight.nvim', config = function() require("twilight").setup {} end}
use {'folke/zen-mode.nvim', config = function() require('plugins.zen') end}
use {'ggandor/lightspeed.nvim'}
use {'jbyuki/instant.nvim', config = function() vim.g.instant_username = 'Nanu00' end}
use {'stevearc/qf_helper.nvim', config = function() require('plugins.qf-helper') end}
use {'https://gitlab.com/yorickpeterse/nvim-pqf', config = function() require('plugins.pqf') end}
use {'Iron-E/nvim-cartographer'}
use {'luukvbaal/stabilize.nvim', config = function() require("stabilize").setup() end}
use {'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = function() require('plugins.lualine') end}
use {'kdheepak/tabline.nvim', config = function() require('plugins.tabline') end, requires = { { 'nvim-lualine/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true}}}
use {'goolord/alpha-nvim', config = function() require('plugins.alpha') end}
use {'kyazdani42/nvim-tree.lua', config = function() require('plugins.nvim-tree') end}
use {'SirVer/ultisnips', requires = {"honza/vim-snippets", rtp = '.'}, config = function() require('plugins.ultisnips') end--[[ , after = 'cmp-nvim-ultisnips' ]]}
-- use {'L3MON4D3/LuaSnip', requires = {"rafamadriz/friendly-snippets"}, config = function() require('plugins.luasnip') end}
use {'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function() require'crates'.setup{} end}
-- use {'iamcco/markdown-preview.nvim', config = function() require('plugins.markdown-preview') end, run = 'cd app && yarn install', ft = 'markdown'}
use {'ellisonleao/glow.nvim', branch = 'main', config = function() require('plugins.glow') end}
use {'tommcdo/vim-exchange'}
use {'stevearc/dressing.nvim', config = function() require('plugins.dressing') end}
use { 'thibthib18/ros-nvim', config=function() require('plugins.ros') end}
