return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = "VeryLazy",
	opts = {

		run_on_start = false,
		ensure_installed = {
			-- Formatters
			"biome",
			"stylua",
			"goimports",
			"gofumpt",

			-- Linters
			"eslint_d",
			"shellcheck",
			"selene",

			--LSPs
			"ts_ls",
			-- "vue_ls",
			"biome",
			"jsonls",
			"yamlls",
			"emmet_ls",
			"gopls",
			"lua_ls",
		},
	},
}
