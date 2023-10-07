vim.call'plug#begin'
local plug = vim.fn['plug#']
plug'neovim/nvim-lspconfig'
plug'hrsh7th/nvim-cmp'
plug'hrsh7th/cmp-nvim-lsp'
plug'hrsh7th/cmp-nvim-lsp'
plug'hrsh7th/cmp-vsnip'
plug'hrsh7th/vim-vsnip'
vim.call'plug#end'

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },{ name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
}})


local capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local servers = { 'html', 'tsserver', 'emmet_ls' }
local lspconfig = require 'lspconfig'
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
