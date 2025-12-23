return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "VeryLazy",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-i>", -- Ctrl+i to accept (same as avante for consistency)
					accept_word = false,
					accept_line = false,
					next = "<C-l>", -- Ctrl+l for next suggestion
					prev = "<C-h>", -- Ctrl+h for previous suggestion
					dismiss = "<C-q>", -- Ctrl+q to dismiss
				},
			},
			filetypes = {
				yaml = false,
				markdown = true,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
				-- Enable for your main languages
				javascript = true,
				typescript = true,
				vue = true,
				go = true,
				lua = true,
			},
			copilot_node_command = "node", -- Node.js version to use to run Copilot
			server_opts_overrides = {},
		})
	end,
}
