-- Check for packer.nvim installation. Install if it's missing
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.init source <afile> | PackerSync
  augroup end
]]

-- Have 'packer.nvim' use a popup window
require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float()
    end,
  },
}

require('packer').startup(function()

    use 'wbthomason/packer.nvim'         -- Package manager
    use 'nvim-lua/plenary.nvim'          -- Useful lua functions for nvim
    use "nvim-lua/popup.nvim"            -- An implementation of the Popup API from vim in Neovim
    use 'nvim-telescope/telescope.nvim'  -- The one and only
    
    -- Snippets!
    use 'L3MON4D3/LuaSnip'               -- Snippet engine
    use 'rafamadriz/friendly-snippets'    -- Collection of snippets

    -- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }, -- Optional for file icons
      config = function() require'nvim-tree'.setup {} end
    }

    -- Completion
    use 'hrsh7th/nvim-cmp'        -- Completion engine
    use 'hrsh7th/cmp-buffer'      -- Words in buffer
    use 'hrsh7th/cmp-path'        -- Filesystem path
    use 'hrsh7th/cmp-nvim-lsp'    -- LSP completion
    use 'saadparwaiz1/cmp_luasnip'    -- LSP completion

    -- LSPs
    use 'neovim/nvim-lspconfig'           -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer' -- LSP installation wrapper
    use 'folke/lsp-colors.nvim'           -- Adds LSP related highlights groups optional to some plugins
    use "ThePrimeagen/refactoring.nvim"   -- General refactoring capabilities

    use { "folke/trouble.nvim",  -- Prettier quickfix / location
      requires = "kyazdani42/nvim-web-devicons",
      config = function() require("trouble").setup { } end
    }

    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'} -- Colour coding tree sitter
    use 'p00f/nvim-ts-rainbow'  -- Colour matched parenthesis

    use {'lewis6991/gitsigns.nvim',  -- Git integration
      config = function() require('gitsigns').setup() end
    }

    -- bottom and upper lines
    use 'nvim-lualine/lualine.nvim'
    use 'seblj/nvim-tabline'

    -- Colorschemes
    use 'folke/tokyonight.nvim'
    use 'Mofiqul/dracula.nvim'
    use "EdenEast/nightfox.nvim"
    use "EdenEast/duskfox.nvim"

    use 'tpope/vim-fugitive'  -- Git integration
    use 'junegunn/goyo.vim'   -- Distractionless writing
    use 'tpope/vim-obsession' -- Session manager
    use 'vimwiki/vimwiki'     -- Wiki within vim

    -- Debugger adapter protocols
    use 'mfussenegger/nvim-dap'          -- Main Debugger adapter protocol
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'mfussenegger/nvim-dap-python'   -- Python debugger. Requires 'debugpy' installed in virtualenv

    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

    --use {'nvim-orgmode/orgmode', config = function() require('orgmode').setup{} end }

    -- If packer has just been installed, install all plugins
    if PACKER_BOOTSTRAP then require('packer').sync() end
  end
)

require 'plugins/cmp'
require 'plugins/telescope'
require 'plugins/treesitter'
require 'plugins/lualine'
require 'plugins/dap'
require('refactoring').setup({})
vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
