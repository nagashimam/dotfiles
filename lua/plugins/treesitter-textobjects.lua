return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	-- Lazy load on first use of textobject keybindings
	keys = {
		-- Select textobjects
		{ "af", mode = { "x", "o" }, desc = "Select outer function" },
		{ "if", mode = { "x", "o" }, desc = "Select inner function" },
		{ "aa", mode = { "x", "o" }, desc = "Select outer parameter" },
		{ "ia", mode = { "x", "o" }, desc = "Select inner parameter" },
		-- Move to next/previous textobjects
		{ "]f", desc = "Next function start" },
		{ "]F", desc = "Next function end" },
		{ "[f", desc = "Previous function start" },
		{ "[F", desc = "Previous function end" },
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true, -- Automatically jump forward to textobj
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- Set jumps in the jumplist
					goto_next_start = {
						["]f"] = "@function.outer",
					},
					goto_next_end = {
						["]F"] = "@function.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
					},
					goto_previous_end = {
						["[F"] = "@function.outer",
					},
				},
			},
		})
	end,
}
