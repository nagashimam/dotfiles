return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Time in ms to wait for a mapped sequence
	end,
	opts = {
		preset = "modern", -- "classic", "modern", or "helix"
		delay = 500, -- Delay before showing the popup (ms)
		filter = function(mapping)
			-- Exclude certain mappings
			return mapping.desc and mapping.desc ~= ""
		end,
		show_help = true,
		show_keys = true,
		plugins = {
			marks = true, -- Show marks
			registers = true, -- Show registers
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true, -- Adds help for operators like d, y, c
				motions = true, -- Adds help for motions
				text_objects = true, -- Help for text objects triggered after entering an operator
				windows = true, -- Default bindings on <c-w>
				nav = true, -- Misc bindings to work with windows
				z = true, -- Bindings for folds, spelling and others prefixed with z
				g = true, -- Bindings for prefixed with g
			},
		},
		win = {
			border = "rounded",
			padding = { 2, 2, 2, 2 },
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+",
		},
		sort = { "local", "order", "group", "alphanum", "mod" },
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Document your existing leader key groups
		wk.add({
			-- Telescope (file/code search)
			{ "<leader>t", group = "Telescope" },
			{ "<leader>tf", desc = "Find files" },
			{ "<leader>tg", desc = "Grep in files" },
			{ "<leader>te", desc = "Grep by extension" },
			{ "<leader>tb", desc = "Find in buffers" },
			{ "<leader>tr", desc = "Find in git branches" },

			-- LSP actions
			{ "<leader>l", group = "LSP" },
			{ "<leader>lh", desc = "Hover documentation" },
			{ "<leader>lr", desc = "Rename symbol" },
			{ "<leader>lc", desc = "Code action" },
			{ "<leader>ld", desc = "Show diagnostic" },

			-- Git actions (gitsigns)
			{ "<leader>g", group = "Git" },
			{ "<leader>gs", desc = "Stage hunk" },
			{ "<leader>gr", desc = "Reset hunk" },
			{ "<leader>gS", desc = "Stage buffer" },
			{ "<leader>gu", desc = "Undo stage hunk" },
			{ "<leader>gR", desc = "Reset buffer" },
			{ "<leader>gp", desc = "Preview hunk" },
			{ "<leader>gb", desc = "Blame line" },
			{ "<leader>gd", desc = "Diff this" },
			{ "<leader>gD", desc = "Diff this ~" },
			{ "<leader>gt", group = "Git toggles" },
			{ "<leader>gtb", desc = "Toggle line blame" },
			{ "<leader>gtd", desc = "Toggle deleted" },

			-- Formatting
			{ "<leader>m", desc = "Format file or range" },

			-- Other utilities
			{ "<leader>,", desc = "Clear search highlight" },

			-- AI (added by avante)
			{ "<leader>a", group = "AI" },

			-- Jump list navigation
			{ "]]", desc = "Jump forward (Ctrl-i)" },
			{ "[[", desc = "Jump backward (Ctrl-o)" },

			-- Diagnostics navigation
			{ "[g", desc = "Previous diagnostic" },
			{ "]g", desc = "Next diagnostic" },

			-- LSP navigation
			{ "]d", desc = "Go to definition" },
			{ "]r", desc = "Go to references" },
			{ "]t", desc = "Go to type definition" },

			-- Git hunk navigation
			{ "]h", desc = "Next git hunk" },
			{ "[h", desc = "Previous git hunk" },

			-- Function navigation (treesitter)
			{ "]f", desc = "Next function start" },
			{ "[f", desc = "Previous function start" },
			{ "]F", desc = "Next function end" },
			{ "[F", desc = "Previous function end" },

			-- AI diff navigation (avante)
			{ "]c", desc = "Next AI conflict/change" },
			{ "[c", desc = "Previous AI conflict/change" },
			{ "]x", desc = "Next AI conflict" },
			{ "[x", desc = "Previous AI conflict" },

			-- Incremental selection (treesitter)
			{ "<CR>", desc = "Expand selection", mode = "v" },
			{ "<BS>", desc = "Shrink selection", mode = "v" },
		})
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
