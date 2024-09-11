local treesitter_config = {}

treesitter_config.setup = function()
	require('nvim-treesitter.configs').setup {
		ensure_installed = {"go", "lua", "java"},
		auto_install = true,
		highlight = {
			enable = true
		}
	}
end

return treesitter_config
