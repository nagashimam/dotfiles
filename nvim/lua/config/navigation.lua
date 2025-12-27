-- Navigation keymaps

-- Wrap-aware movement
vim.keymap.set("n", "k", "gk", { desc = "Move up by display line" })
vim.keymap.set("n", "j", "gj", { desc = "Move down by display line" })

-- Jumplist navigation
vim.keymap.set("n", "[[", "<C-o>", { desc = "Jump to older position" })
vim.keymap.set("n", "]]", "<C-i>", { desc = "Jump to newer position" })
