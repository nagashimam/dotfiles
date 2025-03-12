local lint = require("lint")
lint.linters_by_ft = {
  html = { "markuplint" },
  css = { "stylelint" },
  scss = { "stylelint" },
  javascript = { "biomejs", "eslint" },
  typescript = { "biomejs", "eslint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
