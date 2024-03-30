vim.call('plug#begin')
local plug = vim.fn['plug#']
plug('neovim/nvim-lspconfig')
plug('folke/neodev.nvim')
plug('neovim/nvim-lspconfig')
plug('hrsh7th/cmp-nvim-lsp')
plug('hrsh7th/cmp-buffer')
plug('hrsh7th/cmp-path')
plug('hrsh7th/cmp-cmdline')
plug('hrsh7th/nvim-cmp')
plug('hrsh7th/cmp-vsnip')
plug('hrsh7th/vim-vsnip')
plug('nvim-tree/nvim-web-devicons')
plug('nvim-telescope/telescope-fzf-native.nvim',
  {
    ['do'] =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  })
plug('neoclide/coc.nvim', { ['branch'] = 'release' })
plug('nvim-lua/plenary.nvim')
plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })

if UsingHomePC then
  plug('rebelot/kanagawa.nvim')
end

plug("NeogitOrg/neogit")
plug("sindrets/diffview.nvim")
vim.call('plug#end')
