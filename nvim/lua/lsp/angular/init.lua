local cmd = { "ngserver", "--stdio", "--tsProbeLocations", vim.fn.getcwd() .. "/node_modules", "--ngProbeLocations",
  "/home/nagashima/.nodenv/versions/20.15.0/lib/node_modules" }
require('lspconfig').angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config, _new_root_dir)
    new_config.cmd = cmd
  end,
}

vim.cmd([[
  augroup fmt_and_lint
    autocmd!
    autocmd BufWritePost *.ts,*.html,*.css,*.scss silent! execute '!npx prettier --write %'
    autocmd BufWritePost *.ts,*.html,*.css,*.scss silent! execute '!npx eslint --fix %'
  augroup END
]])
