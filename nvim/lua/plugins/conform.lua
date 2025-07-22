return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile", "BufReadPost" },
	dependencies = {
		"williamboman/mason.nvim",
		"jay-bails/mason-tool-installer.nvim",
	},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				css = { "biome" },
				html = { "biome" },
				json = { "biome" },
				yaml = { "biome" },
				go = { "goimports", "gofmt" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
				async = false,
			},

			keys = {
				{
					"<leader>m",
					function()
						require("conform").format({
							lsp_format = "fallback",
							async = false,
							timeout_ms = 500,
						})
					end,
					mode = { "n", "v" },
					desc = "Format file or range (Conform)",
				},
			},
		})
	end,
}
