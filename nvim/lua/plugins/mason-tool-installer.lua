return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			-- Formatters
			"biome",
			"stylua",
			"goimports",
			"gofumpt",

			-- Linters
			"eslint_d",
			"shellcheck",
			-- Note: Vue.js support via ts_ls with @vue/typescript-plugin (no separate vue_ls)
		},
	},
}
