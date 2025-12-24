return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "BufNewFile" },
	opts = {
		linters_by_ft = {
			html = { "eslint" },
			css = { "eslint" },
			scss = { "eslint" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			lua = { "selene" },
		},
		linters = {
			luacheck = {
				args = { "--globals", "vim" },
			},
		},
	},
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
