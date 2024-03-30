--[[
デフォルト値は""。カンマ区切りなので、デフォルトから変えている場合は
vim.o.clipboard = vim.o.clipboard .. ",unnamedplus"
]]
vim.o.clipboard = "unnamedplus"

vim.o.ignorecase = true
vim.o.smartcase = true

-- 履歴からコマンドを呼び出すときに、フィルタリングを行う
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

vim.o.history = 200

vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

require("neogit").setup({})
