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
  local text = table.concat(lines, '\n')
  local base64 = vim.base64.encode(text)
  local osc52 = string.format('\027]52;c;%s\007', base64)

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
  local content = vim.fn.getreg('"', 1, 1)  -- Get as list of lines
  local regtype = vim.fn.getregtype('"')     -- Get register type (v/V/^V)
  return {content, regtype}
end

-- Configure clipboard provider
vim.g.clipboard = {
  name = 'OSC52-WindowsTerminal',
  copy = {
    ['+'] = osc52_copy,
    ['*'] = osc52_copy,
  },
  paste = {
    ['+'] = dummy_paste,
    ['*'] = dummy_paste,
  },
}

-- Set clipboard to use system clipboard register
-- This makes y/p use the + register by default
vim.opt.clipboard = 'unnamedplus'

-- Performance note: OSC 52 copy is near-instant with this configuration
-- No external dependencies (win32yank, xclip, etc.) needed
