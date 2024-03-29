vim.call'plug#begin'
local plug = vim.fn['plug#']
plug'neovim/nvim-lspconfig'
plug('neoclide/coc.nvim', {branch = 'release'})
plug("rebelot/kanagawa.nvim")
vim.call'plug#end'

