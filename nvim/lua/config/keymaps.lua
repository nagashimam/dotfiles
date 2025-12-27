-- Keymap configurations
-- Leader key must be set before plugins load
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Insert mode: jj to escape
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
