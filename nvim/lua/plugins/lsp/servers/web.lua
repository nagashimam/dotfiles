-- Web Development LSP Servers
-- JSON, YAML, HTML/CSS (Emmet), and Biome

return function(capabilities)
	local schemas = require("schemastore").json.schemas()

	-- Add Gemini CLI settings schema
	table.insert(schemas, {
		fileMatch = { ".gemini/settings.json" },
		url = "https://raw.githubusercontent.com/google-gemini/gemini-cli/main/schemas/settings.schema.json",
	})

	-- JSON Language Server
	vim.lsp.config("jsonls", {
		capabilities = capabilities,
		cmd = { "vscode-json-language-server", "--stdio" },
		filetypes = { "json", "jsonc" },
		settings = {
			json = {
				schemas = schemas,
				validate = { enable = true },
			},
		},
	})

	-- YAML Language Server
	vim.lsp.config("yamlls", {
		capabilities = capabilities,
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml", "yaml.docker-compose" },
	})

	-- Emmet (HTML/CSS abbreviation expansion)
	vim.lsp.config("emmet_ls", {
		capabilities = capabilities,
		cmd = { "emmet-ls", "--stdio" },
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue" },
	})
end
