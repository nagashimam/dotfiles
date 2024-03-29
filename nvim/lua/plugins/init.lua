vim.call('plug#begin')
local plug = vim.fn['plug#']
plug('neovim/nvim-lspconfig')
plug('neoclide/coc.nvim', { ["branch"] = 'release' })
plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
plug("folke/tokyonight.nvim")
vim.call('plug#end')
require("tokyonight").setup({ 
  transparent = true,
  styles = {
    sidebars = "transparent",
    floats = "transparent" 
  }
})
vim.cmd("colorscheme tokyonight")
