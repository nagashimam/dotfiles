vim.g.mapleader = " "

vim.keymap.set("n", "<leader>,", [[<Cmd>:nohl<CR>]])
vim.keymap.set("i", "jj", "<Esc>")

local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fl', builtin.treesitter, {})

vim.keymap.set({ "n", "v", "o" }, "fj,", "f、")
vim.keymap.set({ "n", "v", "o" }, "Fj,", "F、")
vim.keymap.set({ "n", "v", "o" }, "tj,", "t、")
vim.keymap.set({ "n", "v", "o" }, "Tj,", "T、")

vim.keymap.set({ "n", "v", "o" }, "fj.", "f。")
vim.keymap.set({ "n", "v", "o" }, "Fj.", "F。")
vim.keymap.set({ "n", "v", "o" }, "tj.", "t。")
vim.keymap.set({ "n", "v", "o" }, "Tj.", "T。")

local function findOne(command, chars)
  local previousCursorPosition = vim.fn.getpos(".")[3]
  for _, char in pairs(chars) do
    vim.cmd("normal " .. command .. char)
    local currentCursorPosition = vim.fn.getpos(".")[3]
    if previousCursorPosition ~= currentCursorPosition then
      break
    end
  end
end
vim.keymap.set({ "n", "v", "o" }, [[fj"]], function () findOne("f", { "「", "『", "』", "」" }) end)
vim.keymap.set({ "n", "v", "o" }, [[Fj"]], function () findOne("F", { "」", "』", "『", "「" }) end)
vim.keymap.set({ "n", "v", "o" }, [[tj"]], function () findOne("t", { "「", "『", "』", "」" }) end)
vim.keymap.set({ "n", "v", "o" }, [[Tj"]], function () findOne("T", { "」", "』", "『", "「" }) end)


vim.keymap.set("n", "[b", [[<Cmd>:bprev<CR>]])
vim.keymap.set("n", "]b", [[<Cmd>:bnext<CR>]])
vim.keymap.set("n", "[B", [[<Cmd>:bfirst<CR>]])
vim.keymap.set("n", "]B", [[<Cmd>:blast<CR>]])

vim.keymap.set("n", "[t", [[<Cmd>:tabprev<CR>]])
vim.keymap.set("n", "]t", [[<Cmd>:tabnext<CR>]])
vim.keymap.set("n", "[T", [[<Cmd>:tabfirst<CR>]])
vim.keymap.set("n", "]T", [[<Cmd>:tablast<CR>]])

-- TODO;Zellijのキーとバッティングしているのをなんとかする
vim.keymap.set("n", "<leader>j", "<C-i>")
vim.keymap.set("n", "<leader>k", "<C-o>")
