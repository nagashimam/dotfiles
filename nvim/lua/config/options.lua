-- Vim options configuration
-- Optimized for code reading and understanding

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true         -- Highlight search results

-- History
vim.opt.history = 200

-- Tabs and indentation
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- UI - Optimized for code reading
vim.opt.wrap = true
vim.opt.number = true           -- Line numbers for code navigation
vim.opt.relativenumber = false  -- Absolute numbers easier for reading
vim.opt.signcolumn = "yes"      -- Always show sign column (LSP diagnostics)
vim.opt.cursorline = true       -- Highlight current line

-- Code reading enhancements
vim.opt.scrolloff = 8           -- Keep 8 lines visible above/below cursor
vim.opt.sidescrolloff = 8       -- Keep 8 columns visible
vim.opt.colorcolumn = "80,120"  -- Visual guides at 80 and 120 chars

-- File handling
vim.opt.autoread = true         -- Reload files changed outside vim
vim.opt.backup = false          -- No backup files (use git)
vim.opt.swapfile = false        -- No swap files

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Folding (Treesitter-based, disabled by default)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false      -- Don't fold by default

-- Performance
vim.opt.updatetime = 250        -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 300        -- Faster which-key popup

-- Terminal colors
vim.opt.termguicolors = true
