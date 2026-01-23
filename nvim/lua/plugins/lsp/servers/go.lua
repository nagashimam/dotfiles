-- Go LSP Configuration
-- Uses gopls with gofumpt formatting

return function(capabilities)
	vim.lsp.config("gopls", {
		capabilities = capabilities,
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
		},
	})
end
