require("lspconfig").html.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = require("lsp.util").on_attach
})
