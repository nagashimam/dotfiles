vim.call'plug#begin'
local plug = vim.fn['plug#']
plug'neovim/nvim-lspconfig'
plug('neoclide/coc.nvim', {branch = 'release'})
vim.call'plug#end'

