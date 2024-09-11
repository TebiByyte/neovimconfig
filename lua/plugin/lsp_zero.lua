local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local lsp_attach = function(client, bufnr)
	local opts = {buffer = bufner}
	require("plugin.bindings").set_lsp_binds(opts)
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
--Server configurations go here
require('mason').setup({})

require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-Space'] = cmp.mapping.complete(),

		['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
		['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})
