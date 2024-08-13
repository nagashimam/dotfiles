local cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd() .. "/node_modules", "--ngProbeLocations",
  "/home/nagashima/.nodenv/versions/20.15.0/lib/node_modules" }
require('lspconfig').angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config, _new_root_dir)
    new_config.cmd = cmd
  end,
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      command = "silent! execute '!npx prettier --write %'",
    })
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      command = "silent! execute '!npx eslint --fix %'",
    })
  end,
}
