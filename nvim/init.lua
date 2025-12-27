-- Neovim configuration entry point
-- Performance: Lazy-load everything possible

-- Load leader key first (required before lazy.nvim)
require("config.keymaps")

-- Load clipboard configuration (critical for Docker/WSL2/Windows)
require("config.clipboard")

require("config.navigation")
-- Load vim options
require("config.options")

-- Bootstrap and load lazy.nvim plugin manager
require("config.lazy")
