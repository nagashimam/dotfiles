return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = "MCPHub", -- Lazy load on :MCPHub command
	config = function()
		require("mcphub").setup({
			-- MCP server configuration file location
			servers_config_path = vim.fn.expand("~/.config/mcphub/servers.json"),

			-- Extensions configuration
			extensions = {
				avante = {
					make_slash_commands = true, -- Enable /mcp:server:prompt commands in Avante
				},
			},

			-- Auto-approval configuration for Serena's read-only semantic tools
			auto_approve = function(params)
				-- Auto-approve Serena's read-only semantic code operations
				if params.server_name == "serena" then
					local safe_tools = {
						"goto_definition",
						"find_references",
						"get_symbols",
						"search_symbols",
						"get_diagnostics",
						"get_hover",
						"get_signature_help",
					}
					for _, tool in ipairs(safe_tools) do
						if params.tool_name == tool then
							return true
						end
					end
				end
				-- Require manual approval for all other tools (like apply_edits)
				return false
			end,
		})
	end,
}
