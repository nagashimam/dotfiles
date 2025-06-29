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
    "matchit"
}

for _, plugin in ipairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
