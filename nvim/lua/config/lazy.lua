-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim to load all plugins from lua/plugins/
require("lazy").setup("plugins", {
  -- Performance optimizations
  checker = {
    enabled = false,  -- Disable automatic update checks (manual control)
    notify = false,
  },
  change_detection = {
    enabled = true,
    notify = false,   -- Silent config reload
  },
  performance = {
    rtp = {
      -- Disable unused built-in plugins for faster startup
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrw",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
