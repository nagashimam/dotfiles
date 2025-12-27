-- Keymap configurations
-- Leader key must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode: jj to escape
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
-- CodeCompanion keybindings for AI-powered code understanding
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<cr>", { desc = "Open AI Chat" })
vim.keymap.set("v", "<leader>cc", "<cmd>CodeCompanionChat<cr>", { desc = "Chat with selection" })
vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
vim.keymap.set("v", "<leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions on selection" })

-- Quick prompts for code understanding
vim.keymap.set("v", "<leader>ce", "<cmd>CodeCompanion /explain<cr>", { desc = "Explain code" })
vim.keymap.set("v", "<leader>cp", "<cmd>CodeCompanion /patterns<cr>", { desc = "Find design patterns" })
vim.keymap.set("v", "<leader>cr", "<cmd>CodeCompanion /review<cr>", { desc = "Review code" })

-- Inline mode (for quick edits)
vim.keymap.set({ "n", "v" }, "<leader>ci", "<cmd>CodeCompanionInline<cr>", { desc = "Inline AI edit" })

-- Toggle chat window
vim.keymap.set("n", "<leader>ct", "<cmd>CodeCompanionToggle<cr>", { desc = "Toggle AI chat" })

