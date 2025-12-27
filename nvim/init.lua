-- Neovim configuration entry point
-- Performance: Lazy-load everything possible

-- Load clipboard first (critical for Docker/WSL2/Windows)
require("config.clipboard")

-- Load keymaps
require("config.keymaps")
require("config.navigation")
