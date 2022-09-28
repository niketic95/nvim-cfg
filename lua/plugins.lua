return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use  {'nvim-telescope/telescope.nvim',requires = {'nvim-lua/plenary.nvim'}}
  use 'neovim/nvim-lspconfig' -- Not configured
  use 'nvim-treesitter/nvim-treesitter'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-lualine/lualine.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'sbdchd/neoformat'
  use {'TimUntersberger/neogit', requires = {'nvim-lua/plenary.nvim'}}
  use 'phaazon/hop.nvim'
end)
