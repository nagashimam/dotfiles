function findOne(command, chars)
  local previousCursorPosition = vim.fn.getpos(".")[3]
  for _, char in pairs(chars) do
    vim.cmd("normal " .. command .. char)
    local currentCursorPosition = vim.fn.getpos(".")[3]
    if previousCursorPosition ~= currentCursorPosition then
      break
    end
  end
end

function toggleRelativeNumber()
  local param = (vim.wo.relativenumber and "norelativenumber") or "relativenumber"
  vim.cmd("set " .. param)
end

vim.keymap.set("i", "jj", "<Esc>")

-- 履歴からコマンドを呼び出すときに、フィルタリングを行う
vim.keymap.set("c", "<C-p>", "<Up>")
vim.keymap.set("c", "<C-n>", "<Down>")

vim.keymap.set({"n","v"}, "j", "gj")
vim.keymap.set({"n","v"}, "k", "gk")

vim.keymap.set("n", "<Leader>,", [[<Cmd>:nohl<CR>]])
vim.keymap.set("n", "<Leader>rn", function() toggleRelativeNumber() end)

vim.keymap.set({"n", "v", "o"}, "fj,", "f、")
vim.keymap.set({"n", "v", "o"}, "Fj,", "F、")
vim.keymap.set({"n", "v", "o"}, "tj,", "t、")
vim.keymap.set({"n", "v", "o"}, "Tj,", "T、")

vim.keymap.set({"n", "v", "o"}, "fj.", "f。")
vim.keymap.set({"n", "v", "o"}, "Fj.", "F。")
vim.keymap.set({"n", "v", "o"}, "tj.", "t。")
vim.keymap.set({"n", "v", "o"}, "Tj.", "T。")

vim.keymap.set({"n", "v", "o"}, [[fj"]], function() findOne("f", {"「","『","』","」"}) end)
vim.keymap.set({"n", "v", "o"}, [[Fj"]], function() findOne("F", {"」","』","『","「"}) end)
vim.keymap.set({"n", "v", "o"}, [[tj"]], function() findOne("t", {"「","『","』","」"}) end)
vim.keymap.set({"n", "v", "o"}, [[Tj"]], function() findOne("T", {"」","』","『","「"}) end)

vim.keymap.set("n", "<Leader>v", [[<Cmd>:edit $NVIMCONF/lua/mappings/init.lua<CR> <Cmd>:vnew $NVIMCONF/lua/settings/init.lua<CR>]])
vim.keymap.set("n", "<Leader>s", [[
  <Cmd>:source $NVIMCONF/lua/mappings/init.lua<CR> 
  <Cmd>:source $NVIMCONF/lua/settings/init.lua<CR>
  <Cmd>:source $NVIMCONF/lua/plugins/init.lua<CR>
]])

vim.keymap.set("n", "[b", [[<Cmd>:bprev<CR>]])
vim.keymap.set("n", "]b", [[<Cmd>:bnext<CR>]])
vim.keymap.set("n", "[B", [[<Cmd>:bfirst<CR>]])
vim.keymap.set("n", "]B", [[<Cmd>:blast<CR>]])

vim.keymap.set("n", "[t", [[<Cmd>:tabprev<CR>]])
vim.keymap.set("n", "]t", [[<Cmd>:tabnext<CR>]])
vim.keymap.set("n", "[T", [[<Cmd>:tabfirst<CR>]])
vim.keymap.set("n", "]T", [[<Cmd>:tablast<CR>]])
 
vim.keymap.set("n", "<Leader>p", [[<Cmd>:RecursivePath<CR>]])
