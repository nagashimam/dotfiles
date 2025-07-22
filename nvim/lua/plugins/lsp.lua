return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"biome",
				"jsonls",
				"yamlls",
				"emmet_ls",
				"gopls",
				"lua_ls",
			},
		})

		local function prev_diagnostic()
			vim.diagnostic.jump({ count = -1, float = true })
		end

		local function next_diagnostic()
			vim.diagnostic.jump({ count = 1, float = true })
		end

		local function format_code()
			vim.lsp.buf.format({ async = false })
		end

		vim.keymap.set("n", "]d", vim.lsp.buf.definition, { desc = "Go to Definition" })
		vim.keymap.set("n", "]r", vim.lsp.buf.references, { desc = "Go to References" })
		vim.keymap.set("n", "]t", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

		vim.keymap.set("n", "[[", prev_diagnostic, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]]", next_diagnostic, { desc = "Go to next diagnostic" })

		vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename Symbol" })
		vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, { desc = "Code Action" })
		vim.keymap.set("n", "<leader>o", format_code, { desc = "Format Code" })
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic float" })

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
		})
	end,
}
