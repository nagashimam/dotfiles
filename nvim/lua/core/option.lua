-- For disable some builtin plugins, see https://github.com/neovim/neovim/blob/master/runtime/plugin/plugin.vim
-- And see https://www.reddit.com/r/neovim/comments/1330de5/comment/ji8f22y/?utm_source=share&utm_medium=web2x&context=3

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logiPat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in ipairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

local win32yank_path = vim.fn.exepath("win32yank.exe")
vim.g.clipboard = {
	name = "win32yank",
	copy = {
		["+"] = win32yank_path .. " -i",
		["*"] = win32yank_path .. " -i",
	},
	paste = {
		["+"] = win32yank_path .. " -o",
		["*"] = win32yank_path .. " -o",
	},
}

vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- History
vim.opt.history = 200

-- Tabs
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- UI
vim.opt.wrap = true
