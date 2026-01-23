-- LSP Keymaps
-- All LSP-related keybindings in one place

-- Diagnostic navigation
local function prev_diagnostic()
	vim.diagnostic.jump({ count = -1, float = true })
end

local function next_diagnostic()
	vim.diagnostic.jump({ count = 1, float = true })
end

-- Go-to keybindings (without leader prefix for quick access)
vim.keymap.set("n", "]d", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "]r", vim.lsp.buf.references, { desc = "Go to References" })
vim.keymap.set("n", "]t", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })

-- Diagnostic navigation
vim.keymap.set("n", "[g", prev_diagnostic, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]g", next_diagnostic, { desc = "Go to next diagnostic" })

-- LSP actions with <leader>l prefix
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
vim.keymap.set("n", "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type Definitions" })
vim.keymap.set("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "Implementations" })
vim.keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace Symbols" })
