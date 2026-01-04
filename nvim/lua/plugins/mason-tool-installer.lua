return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = "VeryLazy",
	opts = {

		run_on_start = false,
		ensure_installed = {
			-- Formatters
			"stylua",
			"goimports",
			"gofumpt",
			"prettierd",

			-- Linters
			"eslint_d",
			"shellcheck",
			"selene",

			--LSPs
			"ts_ls",
			"biome", -- Formatter + Linter + LSP for JS/TS/JSON
			"jsonls",
			"yamlls",
			"emmet_ls",
			"gopls",
			"lua_ls",
		},
	},
}
