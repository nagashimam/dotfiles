require("mason").setup()
local util = require('util')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {"lua_ls"};
for _, server in ipairs(servers) do
  local config = require("lsp." .. server)
  lspconfig[server].setup(
    util.merge_tables(config,{
      capabilities = capabilities,
    }))
end
