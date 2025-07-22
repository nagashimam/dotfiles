return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			"biome",
			"stylua",
			"goimports",
			"gofumpt",
			"eslint_d",
			"shellcheck",
		},
	},
}
