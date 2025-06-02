require("config.lazy_bootstrap")

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
  spec = {
    { import = "plugins" },
    {
      "rebelot/kanagawa.nvim",
      opts = { transparent = true },
    },
  },
  install = { colorscheme = { "rebelot/kanagawa.nvim" } },
  checker = { enabled = true },
})  
