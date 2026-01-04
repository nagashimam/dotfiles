return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile", "BufReadPost" },
	dependencies = {
		"williamboman/mason.nvim",
		"jay-bails/mason-tool-installer.nvim",
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
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "biome" },
				yaml = { "biome" },
				-- Go: Let gopls handle imports + formatting (via gofumpt)
				vue = { "prettierd" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
				async = false,
			},
		})
	end,
}
