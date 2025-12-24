return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context", -- Show context at top
	},
	config = function()
		-- List of parsers to install
		local parsers = {
			-- Core
			"lua",
			"vim",
			"vimdoc",
			"query",

			-- Web development
			"javascript",
			"typescript",
			"tsx",
			"vue",
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
		}

		-- Create a command to install all required parsers
		vim.api.nvim_create_user_command("TSInstallDeps", function()
			require("nvim-treesitter").install(parsers)
		end, {})

		-- Automatically install missing parsers (optional, can be disabled for speed)
		-- We defer this to ensure it doesn't block startup
		vim.defer_fn(function()
			-- Note: On the main branch, we check for installed parsers differently or just rely on manual install.
			-- Here we simply provide the command :TSInstallDeps for the user to run.
			-- If you want auto-install, you can uncomment the next line, but it might verify on every load.
			-- require("nvim-treesitter").install(parsers)
		end, 0)

		-- Enable Treesitter highlighting
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ok = pcall(vim.treesitter.start, args.buf)
				-- If it fails (e.g. no parser), it's fine.
			end,
		})

		-- Treesitter context setup
		-- Note: nvim-treesitter-context might also need updates if it breaks with main branch changes.
		-- Ensure it is loaded after treesitter setup.
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

		-- Folding based on treesitter (using Neovim core API)
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldenable = false -- Don't fold by default
	end,
}

