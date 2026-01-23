return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("mason-nvim-dap").setup({
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = false,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- We don't use ensure_installed here because we use mason-tool-installer
				-- in a separate config file to manage all binaries.
				ensure_installed = {},
			})

			-- Basic debugging keymaps, feel free to change to your liking!
			vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })

			-- Dap UI setup
			-- For more details, see: https://github.com/rcarriga/nvim-dap-ui#configuration
			dapui.setup({
				-- Set icons to characters that are more likely to work in every terminal.
				-- Use different default icons.
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- -----------------------------------------------------------------------
			-- GO CONFIGURATION
			-- -----------------------------------------------------------------------
			-- Requires 'delve' to be installed (managed by mason-tool-installer)

			dap.adapters.delve = {
				type = "server",
				port = "${port}",
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:${port}" },
				},
			}

			-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
			dap.configurations.go = {
				{
					type = "delve",
					name = "Debug",
					request = "launch",
					program = "${file}",
				},
				{
					type = "delve",
					name = "Debug test", -- configuration for debugging test files
					request = "launch",
					mode = "test",
					program = "${file}",
				},
				-- works with go.mod packages and sub packages
				{
					type = "delve",
					name = "Debug test (go.mod)",
					request = "launch",
					mode = "test",
					program = "./${relativeFileDirname}",
				},
			}

			-- -----------------------------------------------------------------------
			-- TYPESCRIPT/VUE CONFIGURATION
			-- -----------------------------------------------------------------------
			-- Requires 'js-debug-adapter' to be installed (managed by mason-tool-installer)

			-- We define the adapter for "pwa-node" and "pwa-chrome" which uses the same
			-- js-debug-adapter binary.
			local js_debug_adapter = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "js-debug-adapter",
					args = { "${port}" },
				},
			}

			dap.adapters["pwa-node"] = js_debug_adapter
			dap.adapters["pwa-chrome"] = js_debug_adapter

			for _, language in ipairs({ "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = 'Start Chrome with "localhost"',
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
						userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
					},
				}
			end
		end,
	},
}

