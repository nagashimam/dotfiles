vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1 -- Disable both wrapper and the main plugin
vim.g.loaded_tutor = 1

vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i",
    ["*"] = "win32yank.exe -i",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

--[[
vim.g.clipboard = {
  name = 'win32yank',
  copy = {
    ['+'] = { '/mnt/c/WINDOWS/system32/win32yank.exe -i' },
    ['*'] = { '/mnt/c/WINDOWS/system32/win32yank.exe -i' },
  },
  paste = {
    ['+'] = { '/mnt/c/WINDOWS/system32/win32yank.exe -o' },
    ['*'] = { '/mnt/c/WINDOWS/system32/win32yank.exe -o' },
  },
}
--]]

vim.opt.clipboard = "unnamedplus"
