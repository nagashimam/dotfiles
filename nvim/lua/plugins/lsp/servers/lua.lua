-- Lua LSP Configuration
-- Configured for Neovim plugin development

return function(capabilities)
	vim.lsp.config("lua_ls", {
		capabilities = capabilities,
		filetypes = { "lua" },
		cmd = { "lua-language-server" },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
				telemetry = {
					enable = false,
				},
			},
		},
	})
end
