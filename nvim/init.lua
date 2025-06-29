require("config.disabled")
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
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("TreesitterMarkdownHighlight", {
		clear = true,
	}),
	pattern = "markdown",
	callback = function(opts)
		-- Ensure the markdown parser is started for highlighting
		vim.treesitter.start(opts.buf, "markdown")
	end,
})

require("config.keymap")
require("config.lazy")
require("config.other")
