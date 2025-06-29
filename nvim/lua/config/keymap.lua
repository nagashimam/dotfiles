vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-D>", function()
	vim.diagnostic.open_float(nil, { focasable = false })
end)

vim.keymap.set("n", "<leader>,", function()
	vim.api.nvim_cmd({ cmd = "nohlsearch" }, {})
end)

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "<leader>j", "<C-i>")
vim.keymap.set("n", "<leader>k", "<C-o>")
vim.keymap.set("n", "]d", function()
	vim.lsp.buf.definition()
end)
