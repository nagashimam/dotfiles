local Plug = vim.fn["plug#"]

vim.call("plug#begin")
-- Copilot
Plug("zbirenbaum/copilot.lua")
Plug("zbirenbaum/copilot-cmp")
Plug("CopilotC-Nvim/CopilotChat.nvim")
Plug("nvim-lua/plenary.nvim")

-- Completion
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-vsnip")
Plug("hrsh7th/vim-vsnip")

-- Formatter
Plug("williamboman/mason.nvim")
Plug("williamboman/mason-lspconfig.nvim")
Plug("mhartington/formatter.nvim")

-- colorscheme
if UsingHomePc then
  Plug("rebelot/kanagawa.nvim")
else
  Plug("folke/tokyonight.nvim")
end
vim.call("plug#end")
