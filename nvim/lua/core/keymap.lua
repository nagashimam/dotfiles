vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "<leader>j", "<C-i>")
vim.keymap.set("n", "<leader>k", "<C-o>")
vim.keymap.set("n", "<leader>,", function()
	vim.cmd("nohlsearch")
end)
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })
