vim.env.ESLINT_D_PPID = vim.fn.getpid()
return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "BufNewFile" },
	opts = {
		linters_by_ft = {
			html = { "eslint_d" },
			css = { "eslint_d" },
			scss = { "eslint_d" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			vue = { "eslint_d" },
			lua = { "selene" },
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
