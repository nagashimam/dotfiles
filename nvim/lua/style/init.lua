local util = require("formatter.util")
local defaults = require("formatter.defaults")

require("formatter").setup({
  logging = false,
  filetype = {
    lua = { require("formatter.filetypes.lua").stylua },
    html = { require("formatter.filetypes.html").prettier },
    scss = { util.withl(defaults.prettier, "scss") },
    css = { require("formatter.filetypes.css").prettier },
    javascript = {
      require("formatter.filetypes.javascript").prettier,
      require("formatter.filetypes.javascript").biome,
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier,
      require("formatter.filetypes.typescript").biome,
    },
    jsonc = { require("formatter.filetypes.json").prettier },
  },
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    vim.cmd("FormatWrite")
  end,
})
