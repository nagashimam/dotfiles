return {
	"mfussenegger/nvim-lint",
	event = { "BufWritePost", "BufReadPost", "BufNewFile" },
	opts = {
		linters_by_ft = {
			html = { "biomejs" },
			css = { "biomejs" },
			scss = { "biomejs" },
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			lua = { "luacheck" },
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
		lint.linters.luacheck.args = opts.linters.luacheck.args

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
