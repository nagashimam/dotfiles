-- LSP configuration for code context and navigation
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Manual LSP setup (no Mason - direct control)
    -- Install language servers manually:
    -- lua-language-server, gopls, typescript-language-server, vscode-langservers-extracted

    local lspconfig = require("lspconfig")

    -- Lua (for Neovim config)
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    -- Go
    lspconfig.gopls.setup({
      capabilities = capabilities,
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    -- TypeScript/JavaScript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    })

    -- Vue.js
    lspconfig.volar.setup({
      capabilities = capabilities,
    })

    -- JSON/YAML
    lspconfig.jsonls.setup({ capabilities = capabilities })
    lspconfig.yamlls.setup({ capabilities = capabilities })

    -- Keybindings for code understanding
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
    vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostics" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

    -- Diagnostic configuration (visual aids for code understanding)
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })
  end,
}
