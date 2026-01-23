-- TypeScript/JavaScript + Vue.js LSP Configuration
-- Uses ts_ls with @vue/typescript-plugin for Vue support

return function(capabilities)
	vim.lsp.config("ts_ls", {
		capabilities = capabilities,
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		cmd = { "typescript-language-server", "--stdio" },
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vim.fn.stdpath("data")
						.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
					languages = { "vue" },
				},
			},
		},
	})
end
