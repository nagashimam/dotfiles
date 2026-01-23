-- LSP Capabilities Configuration
-- Sets up completion capabilities from nvim-cmp

local M = {}

function M.setup()
	-- Get completion capabilities from nvim-cmp
	local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

	if has_cmp then
		return cmp_nvim_lsp.default_capabilities()
	else
		-- Fallback to default if cmp is not available
		return vim.lsp.protocol.make_client_capabilities()
	end
end

return M
