-- LSP Configuration Entry Point
-- Orchestrates Mason, LSP servers, keymaps, and UI

return {
	"williamboman/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"b0o/SchemaStore.nvim",
	},
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function(_, opts)
		-- Setup Mason
		require("mason").setup(opts)
		require("mason-lspconfig").setup({
			ensure_installed = {},
		})

		-- Get LSP capabilities from nvim-cmp
		local capabilities = require("plugins.lsp.capabilities").setup()

		-- Configure each language server
		require("plugins.lsp.servers.typescript")(capabilities)
		require("plugins.lsp.servers.go")(capabilities)
		require("plugins.lsp.servers.lua")(capabilities)
		require("plugins.lsp.servers.web")(capabilities)

		-- Enable all configured language servers
		vim.lsp.enable({ "ts_ls", "gopls", "lua_ls", "jsonls", "yamlls", "emmet_ls", "biome" })

		-- Load keymaps and UI configuration
		require("plugins.lsp.keymaps")
		require("plugins.lsp.ui")
	end,
}
