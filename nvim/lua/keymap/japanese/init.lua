vim.keymap.set({ "n", "x", "o" }, "fj,", "f、")
vim.keymap.set({ "n", "x", "o" }, "Fj,", "F、")
vim.keymap.set({ "n", "x", "o" }, "tj,", "t、")
vim.keymap.set({ "n", "x", "o" }, "Tj,", "T、")

vim.keymap.set({ "n", "x", "o" }, "fj.", "f。")
vim.keymap.set({ "n", "x", "o" }, "Fj.", "F。")
vim.keymap.set({ "n", "x", "o" }, "tj.", "t。")
vim.keymap.set({ "n", "x", "o" }, "Tj.", "T。")

vim.keymap.set(
  { "x", "o" },
  'ij"',
  ':<C-u>lua require"keymap.japanese".select_inside_japanese_quotes()<CR>',
  { noremap = true, silent = true }
)
for _, value in ipairs({ "f", "F", "t", "T" }) do
  vim.keymap.set(
    { "n", "x", "o" },
    value .. 'j"',
    ':<C-u>lua require"keymap.japanese".find_one("' .. value .. '",{"「","『","』","」"})<CR>',
    { noremap = true, silent = true }
  )
end

local M = {}
local function find_japanese_quotes(opening_bracket, closing_bracket)
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line_content = vim.api.nvim_get_current_line()

  local start_pos = nil
  local start_i = nil
  while true do
    start_i = string.find(line_content, opening_bracket, (start_i or 0) + 1)
    if start_i == nil or start_i > col then
      break
    end
    start_pos = start_i
  end

  local end_pos = nil
  local end_i = nil
  while true do
    end_i = string.find(line_content, closing_bracket, (end_i or 0) + 1)
    if end_i == nil then
      break
    end
    if end_i >= col then
      end_pos = end_i
      break
    end
  end

  return line, start_pos, end_pos
end

function M.select_inside_japanese_quotes()
  local line, start_pos, end_pos = find_japanese_quotes("『", "』")

  if not start_pos or not end_pos then
    line, start_pos, end_pos = find_japanese_quotes("「", "」")
  end

  if start_pos and end_pos then
    vim.api.nvim_win_set_cursor(0, { line, start_pos + 2 })
    vim.cmd("normal! v")
    vim.api.nvim_win_set_cursor(0, { line, end_pos - 2 })
  end
end

function M.find_one(command, chars)
  local _, previousCursorPosition = unpack(vim.api.nvim_win_get_cursor(0))
  for _, char in pairs(chars) do
    vim.api.nvim_cmd({ cmd = "normal", args = { command .. char } }, {})
    local _, currentCursorPosition = unpack(vim.api.nvim_win_get_cursor(0))
    if previousCursorPosition ~= currentCursorPosition then
      break
    end
  end
end

return M
