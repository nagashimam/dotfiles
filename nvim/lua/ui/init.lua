require("nvim-web-devicons").setup({})
require("nvim-treesitter").setup({})

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.opt.signcolumn = "yes"

vim.diagnostic.config({
  virtual_text = false,
})
vim.o.updatetime = 300
vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
