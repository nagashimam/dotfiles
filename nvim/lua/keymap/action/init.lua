local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("fzf")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<leader>bf", builtin.buffers, {})
vim.keymap.set("n", "<leader>t", builtin.treesitter, {})
vim.keymap.set("n", "<leader>br", builtin.git_branches, {})
vim.keymap.set("n", "<leader>e", function()
  local additional_args = function()
    local extension = vim.fn.input("extension: ")
    return { "--glob", "*." .. extension }
  end
  builtin.live_grep({
    grep_open_files = true,
    additional_args = additional_args,
  })
end, {})
vim.keymap.set("n", "<leader>c", function()
  local actions = require("CopilotChat.actions")
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end)

vim.keymap.set("n", "<C-C>", function()
  vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<C-V>", function()
  vim.lsp.buf.hover()
end)

vim.keymap.set("n", "<C-R>", function()
  vim.lsp.buf.rename()
end)

vim.keymap.set("n", "<C-K>", function()
  vim.lsp.buf.signature_help()
end)
