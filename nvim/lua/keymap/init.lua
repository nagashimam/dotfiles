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

local function toggleRelativeNumber()
  local param = (vim.wo.relativenumber and "norelativenumber") or "relativenumber"
  vim.cmd("set " .. param)
end
vim.keymap.set("n", "<leader>rn", function () toggleRelativeNumber() end)

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
vim.keymap.set("c", "<leader>j", "<Down>")
vim.keymap.set("c", "<leader>k", "<Up>")


function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
local keyset = vim.keymap.set

-- TABで補完を開始
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

--問題がある行にジャンプする
keyset("n", "[p", "<Plug>(coc-diagnostic-prev)", { silent = true })
keyset("n", "]p", "<Plug>(coc-diagnostic-next)", { silent = true })

--CRで補完候補を選択
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

--ジャンプ
keyset("n", "[d", "<Plug>(coc-definition)", { silent = true })
keyset("n", "[y", "<Plug>(coc-type-definition)", { silent = true })
keyset("n", "[i", "<Plug>(coc-implementation)", { silent = true })
keyset("n", "[r", "<Plug>(coc-references)", { silent = true })

-- Kでドキュメント
function _G.show_docs()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval('coc#rpc#ready()') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end

keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- 識別子のリネーム
keyset("n", "<alt-r>", "<Plug>(coc-rename)", { silent = true })
