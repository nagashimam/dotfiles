local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('zbirenbaum/copilot.lua')
Plug('zbirenbaum/copilot-cmp')
Plug('CopilotC-Nvim/CopilotChat.nvim')
Plug('nvim-lua/plenary.nvim')
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
