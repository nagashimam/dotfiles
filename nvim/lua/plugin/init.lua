vim.call('plug#begin')
local plug = vim.fn['plug#']
-- ***補完のエンジン(cmp-XXX)とソース(XXX)
plug('neovim/nvim-lspconfig')
plug('hrsh7th/nvim-cmp')
plug('hrsh7th/cmp-nvim-lsp')
plug('hrsh7th/cmp-buffer')
plug('hrsh7th/cmp-path')
plug('hrsh7th/cmp-cmdline')
plug('hrsh7th/cmp-vsnip')
-- VSCodeのスニペットを使えるようにする
plug('hrsh7th/vim-vsnip')
-- ***補完のためのplugin***

plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

if UsingHomePC then
  plug('rebelot/kanagawa.nvim')
else
  plug('folke/tokyonight.nvim')
end

plug("NeogitOrg/neogit", { ["branch"] = "master" })
-- ***neogitのdependencies****
plug('nvim-lua/plenary.nvim')
plug("sindrets/diffview.nvim")
plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.8' })
-- ***telescopeのdependencies***
plug('nvim-telescope/telescope-fzf-native.nvim',
  {
    ['do'] =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  })
plug('nvim-tree/nvim-web-devicons')
-- ***telescopeのdependencies***
-- ***neogitのdependencies****

plug('monkoose/nvlime')
-- ***nvlimeのdependencies****
plug('monkoose/parsley')
plug('kovisoft/paredit')
-- ***nvlimeのdependencies****

vim.call('plug#end')
