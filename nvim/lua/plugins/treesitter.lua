return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context", -- Show context at top
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Install parsers for your languages
			ensure_installed = {
				-- Core
				"lua",
				"vim",
				"vimdoc",
				"query",

				-- Web development
				"javascript",
				"typescript",
				"tsx",
				"vue", -- Essential for Vue.js
				"html",
				"css",

				-- Backend
				"go",
				"gomod",
				"gowork",
				"gosum",

				-- Config/Data
				"json",
				"yaml",
				"toml",

				-- Other
				"markdown",
				"markdown_inline",
				"bash",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			auto_install = true,

			highlight = {
				enable = true,
				-- Disable slow treesitter highlight for large files
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
				-- Disable for languages with better indent logic
				disable = { "yaml" },
			},

			-- Incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<S-CR>",
					node_decremental = "<BS>",
				},
			},
		})

		-- Treesitter context setup (shows function name at top when scrolling)
		require("treesitter-context").setup({
			enable = true,
			max_lines = 3, -- How many lines the window should span
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor", -- Line used to calculate context. 'cursor', 'topline'
			separator = nil,
			zindex = 20,
			on_attach = nil,
		})

		-- Folding based on treesitter
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = false -- Don't fold by default
	end,
}
