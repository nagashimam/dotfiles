require('lint').linters_by_ft = {
  html = {"markuplint"},
  typescript = {"biomejs"},
  javascript = {"biomejs"},
  lua = {"selene"},
  css = {"stylelint", "biomejs"},
  scss = {"stylelint", "biomejs"}
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
