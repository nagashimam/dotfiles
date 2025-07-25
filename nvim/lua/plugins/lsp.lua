return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"html",
				"cssls",
				"ts_ls",
				"angularls",
				"lua_ls",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"prettier", -- Prettier for formatting
				"stylua", -- Lua formatter
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- lazy load nvim-lspconfig
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp", event = { "BufReadPre", "BufNewFile" } },
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.o.updatetime = 200

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local on_attach = function(_, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				-- --
				vim.keymap.set("n", "]r", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "]i", vim.lsp.buf.implementation, bufopts)

				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<C-c>", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			end

			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			local servers = {
				"html",
				"cssls",
				"ts_ls",
				"angularls",
				"lua_ls",
			}

			for _, server in ipairs(servers) do
				if server == "lua_ls" then
					lspconfig.lua_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						root_dir = function(fname)
							return vim.fn.stdpath("config")
						end,
						settings = {
							Lua = {
								runtime = {
									version = "Lua51",
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
									checkThirdParty = false,
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				else
					lspconfig[server].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end
			end
		end,
	},
}
