return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("lint").linters_by_ft = {
				css = { "stylelint" },
				scss = { "stylelint" },
				javascript = { "biomejs", "eslint" },
				typescript = { "biomejs", "eslint" },
			}
		end,
	},
}
