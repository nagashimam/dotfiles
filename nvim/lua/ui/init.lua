require("nvim-web-devicons").setup({})
require("nvim-treesitter").setup({})

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

vim.opt.signcolumn = "yes"
