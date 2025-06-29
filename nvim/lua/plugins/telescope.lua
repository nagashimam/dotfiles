return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
	keys = {
		{ "<leader>f", "<cmd>Telescope find_files<cr>", "n" },
		{ "<leader>g", "<cmd>Telescope live_grep<cr>", "n" },
		{ "<leader>bf", "<cmd>Telescope buffers<cr>", "n" },
		{ "<leader>t", "<cmd>Telescope treesitter<cr>", "n" },
		{ "<leader>br", "<cmd>Telescope git_branches<cr>", "n" },
		{
			"<leader>e",
			function()
				local builtin = require("telescope.builtin")
				local additional_args = function()
					local extension = vim.fn.input("extension: ")
					return { "--glob", "*." .. extension }
				end
				builtin.live_grep({
					grep_open_files = true,
					additional_args = additional_args,
				})
			end,
			"n",
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({})
		telescope.load_extension("fzf")
	end,
}
