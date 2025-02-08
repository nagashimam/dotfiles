require("mason").setup()
require("mason-lspconfig").setup()
local util = require("util")
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "angularls", "html", "cssls", "biome", "ts_ls" }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
  })
end

local servers_with_custom_config = { "lua_ls" }
for _, server in ipairs(servers_with_custom_config) do
  local config = require("lsp." .. server)
  lspconfig[server].setup(util.merge_tables(config, {
    capabilities = capabilities,
  }))
end
