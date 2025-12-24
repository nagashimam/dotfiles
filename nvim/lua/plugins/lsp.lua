return {
	"williamboman/mason.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason").setup()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				-- "vue_ls",
				"biome",
				"jsonls",
				"yamlls",
				"emmet_ls",
				"gopls",
				"lua_ls",
			},
		})

		-- TypeScript setup with Vue plugin support
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			cmd = { "typescript-language-server", "--stdio" },
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.stdpath("data")
							.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
		})

		-- Go setup
		vim.lsp.config("gopls", {
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
					},
					staticcheck = true,
					gofumpt = true,
				},
			},
		})

		-- Lua setup (for Neovim config)
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			filetypes = { "lua" },
			cmd = { "lua-language-server" },
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- JSON, YAML, and Emmet language servers
		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			cmd = { "vscode-json-language-server", "--stdio" },
			filetypes = { "json", "jsonc" },
		})

		vim.lsp.config("yamlls", {
			capabilities = capabilities,
			cmd = { "yaml-language-server", "--stdio" },
			filetypes = { "yaml", "yaml.docker-compose" },
		})

		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "css", "javascriptreact", "typescriptreact", "vue" },
		})

		-- Biome LSP (linting/formatting)
		vim.lsp.config("biome", {
			capabilities = capabilities,
			cmd = { "biome", "lsp-proxy" },
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "jsonc" },
		})

		-- Enable all configured language servers
		-- vim.lsp.enable({ "vtsls", "vue_ls", "ts_ls", "gopls", "lua_ls", "jsonls", "yamlls", "emmet_ls", "biome" })
		vim.lsp.enable({ "ts_ls", "gopls", "lua_ls", "jsonls", "yamlls", "emmet_ls", "biome" })

		-- Custom LspInfo command
		local function show_lsp_info()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			local buf_ft = vim.bo.filetype

			if #clients == 0 then
				print("No LSP clients attached to current buffer")
				return
			end

			local lines = {
				"LSP clients attached to buffer " .. vim.api.nvim_get_current_buf(),
				"Filetype: " .. buf_ft,
				"",
			}

			for _, client in ipairs(clients) do
				table.insert(lines, "Client: " .. client.name .. " (id: " .. client.id .. ")")
				table.insert(lines, "  Root dir: " .. (client.root_dir or "N/A"))
				table.insert(lines, "  Filetypes: " .. table.concat(client.config.filetypes or {}, ", "))

				-- Count attached buffers
				local attached_bufs = vim.lsp.get_buffers_by_client_id(client.id)
				table.insert(lines, "  Attached buffers: " .. #attached_bufs)
				table.insert(lines, "")
			end

			-- Display in a floating window
			local buf = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
			vim.bo[buf].modifiable = false
			vim.bo[buf].filetype = "lspinfo"

			local width = 80
			local height = #lines
			local win = vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = width,
				height = height,
				row = math.floor((vim.o.lines - height) / 2),
				col = math.floor((vim.o.columns - width) / 2),
				style = "minimal",
				border = "rounded",
				title = " LSP Info ",
				title_pos = "center",
			})

			-- Close on q or Esc
			vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = buf, nowait = true })
			vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = buf, nowait = true })
		end

		vim.api.nvim_create_user_command("LspInfo", show_lsp_info, {})

		local function prev_diagnostic()
			vim.diagnostic.jump({ count = -1, float = true })
		end

		local function next_diagnostic()
			vim.diagnostic.jump({ count = 1, float = true })
		end

		vim.keymap.set("n", "]d", vim.lsp.buf.definition, { desc = "Go to Definition" })
		vim.keymap.set("n", "]r", vim.lsp.buf.references, { desc = "Go to References" })
		vim.keymap.set("n", "]t", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

		vim.keymap.set("n", "[g", prev_diagnostic, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]g", next_diagnostic, { desc = "Go to next diagnostic" })

		-- LSP keybindings with <leader>l prefix
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature Help" })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
		vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Code Action" })
		vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
		vim.keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type Definitions" })
		vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
		vim.keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
		})
	end,
}
