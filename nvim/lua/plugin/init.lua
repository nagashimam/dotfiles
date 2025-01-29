local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug("github/copilot.vim")
Plug 'junegunn/vim-plug'
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')
vim.call('plug#end')
