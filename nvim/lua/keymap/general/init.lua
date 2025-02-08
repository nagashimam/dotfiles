vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>,", function()
  vim.api.nvim_cmd({ cmd = "nohlsearch" }, {})
end)
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "U", function()
  vim.api.nvim_command("redo")
end)
