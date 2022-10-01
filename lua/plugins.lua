return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
  	use  {'nvim-telescope/telescope.nvim',requires = {'nvim-lua/plenary.nvim'}}
  	use 'neovim/nvim-lspconfig' -- Not configured
  	use 'nvim-treesitter/nvim-treesitter'
  	use 'kyazdani42/nvim-tree.lua'
  	use 'nvim-lualine/lualine.nvim'
  	use 'lewis6991/gitsigns.nvim'
  	use 'sbdchd/neoformat'
  	use 'phaazon/hop.nvim'
  	use 'williamboman/mason.nvim'
  	use 'williamboman/mason-lspconfig.nvim'
  	use 'navarasu/onedark.nvim'
  	use {
    	"nvim-neorg/neorg",
    	config = function()
        	require('neorg').setup {
            	load = {
					["core.defaults"] = {}
				}
        	}
    	end,
    	requires = "nvim-lua/plenary.nvim"
	}
  	use 'mfussenegger/nvim-dap'
  	use 'simrat39/rust-tools.nvim'

-- FrameWork
  	use 'hrsh7th/nvim-cmp'
-- LSP source
  	use 'hrsh7th/cmp-nvim-lsp'
-- NeoVim API CMP
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-vsnip'

end)
