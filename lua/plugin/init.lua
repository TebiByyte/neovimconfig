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

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
        }
    }
    require('telescope').setup{
        defaults = {
            file_ignore_patterns = {
                'node_modules'
            }
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    require('lualine').setup()
    --Themeing
    use 'EdenEast/nightfox.nvim'
    require('nightfox').setup({
        options = {
            transparent = true,
        }
    })
    use {'ms-jpq/chadtree'}
    vim.cmd("colorscheme nightfox")
    if packer_info.packer_bootstrap then
        require('packer').sync()
    end
end

require('plugin.lsp_zero')
return require('packer').startup(config)
