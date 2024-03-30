local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.insertReplaceSuport = true

require('lspconfig').angularls.setup({
  capabilities = capabilities,
  on_attach = require("lsp.util").on_attach
})
