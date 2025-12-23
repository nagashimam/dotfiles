local function grep_by_extension()
	local builtin = require("telescope.builtin")
	local extension = vim.fn.input("extension: ")
	if extension and extension ~= "" then
		builtin.live_grep({
			additional_args = function()
				return { "--glob", "*." .. extension }
			end,
		})
	end
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1
			end,
		},
	},
	keys = {
		{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Grep in files" },
		{ "<leader>te", grep_by_extension, desc = "Grep by extension" },
		{ "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Find in buffers" },
		{ "<leader>tr", "<cmd>Telescope git_branches<cr>", desc = "Find in git branches" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules", "target", ".git" },
			},
		})
		telescope.load_extension("fzf")
	end,
}
