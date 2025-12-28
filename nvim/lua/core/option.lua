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

-- OSC 52 Clipboard Configuration for Docker + WSL2 + Windows Terminal
-- Optimized for performance with Windows Terminal workaround
--
-- Background:
-- - Neovim 0.10+ has native OSC 52 support
-- - Windows Terminal supports OSC 52 copy but NOT paste (security reasons)
-- - OSC 52 paste in Windows Terminal can cause 10+ second delays
-- - Workaround: Use OSC 52 for copy only, disable for paste
--
-- Usage:
-- - Yank in Neovim (y, yy, etc.) → Copies to Windows clipboard via OSC 52
-- - Paste in Neovim (p, P) → Uses Neovim's internal register (instant)
-- - Paste from Windows → Use terminal paste (Ctrl+Shift+V or right-click)
-- - Copy from Windows apps → Paste into Neovim via Ctrl+Shift+V

local function osc52_copy(lines)
	-- Build OSC 52 escape sequence
	local text = table.concat(lines, "\n")
	local base64 = vim.base64.encode(text)
	local osc52 = string.format("\027]52;c;%s\007", base64)

	-- Write to terminal
	io.write(osc52)
	io.flush()
end

local function dummy_paste()
	-- Dummy paste function that returns Neovim's internal register
	-- This prevents the 10+ second delay in Windows Terminal
	-- while still allowing normal yank/paste operations (dd, yy, p, etc.)
	--
	-- Returns [lines, regtype] format as required by clipboard provider
	-- For pasting from Windows apps, use terminal paste (Ctrl+Shift+V)
	local content = vim.fn.getreg('"', 1, 1) -- Get as list of lines
	local regtype = vim.fn.getregtype('"') -- Get register type (v/V/^V)
	return { content, regtype }
end

-- Configure clipboard provider
vim.g.clipboard = {
	name = "OSC52-WindowsTerminal",
	copy = {
		["+"] = osc52_copy,
		["*"] = osc52_copy,
	},
	paste = {
		["+"] = dummy_paste,
		["*"] = dummy_paste,
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

-- Refresh on disk change
vim.o.autoread = true
