require("neodev").setup({})

require("lspconfig").lua_ls.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = require("lsp.util").on_attach
})

if not LuaAutoCmdSet then
  LuaAutCmdSet = true
  vim.cmd("autocmd BufWritePre *.lua lua vim.lsp.buf.format()")
end
