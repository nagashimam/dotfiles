require("formatter").setup({
  filetype = {
    html = { require("formatter.filetypes.html").prettier },
    css = { require("formatter.filetypes.css").prettier },
    javascript = { require("formatter.filetypes.javascript").biome },
    javascriptreact = { require("formatter.filetypes.javascriptreact").biome },
    typescript = { require("formatter.filetypes.typescript").biome },
    typescriptreact = { require("formatter.filetypes.typescriptreact").biome },
    lua = { require("formatter.filetypes.lua").stylua },
  },
})

vim.api.nvim_create_augroup("__formatter__", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "__formatter__",
  command = ":FormatWrite",
})
