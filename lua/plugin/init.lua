local packer_info = require("plugin.packer_init")
local treesitter_config = require("plugin.treesitter")

local config = function(use)

	use 'wbthomason/packer.nvim'
	--Load other plugins here
	use 'nvim-treesitter/nvim-treesitter'
	treesitter_config.setup()
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v4.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'}
		}
	}
	
	--Themeing
	use 'EdenEast/nightfox.nvim'
	vim.cmd("colorscheme nightfox")
	if packer_info.packer_bootstrap then
		require('packer').sync()
	end
end

require('plugin.lsp_zero')
return require('packer').startup(config)
