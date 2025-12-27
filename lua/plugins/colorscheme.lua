return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		theme = "lotus",
		transparent = true,
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)
		vim.cmd.colorscheme("kanagawa")

		-- Custom Visual mode highlight for better contrast
		vim.api.nvim_set_hl(0, "Visual", { bg = "#808080", fg = "NONE" })
	end,
}
