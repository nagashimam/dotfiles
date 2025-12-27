-- Treesitter for syntax awareness and code navigation
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- Use main branch, not master
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-context", -- Show function context at top
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install parsers for your languages
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",  -- Neovim
        "javascript", "typescript", "tsx", "vue", -- Frontend
        "go", "gomod", "gowork",          -- Backend
        "json", "yaml", "toml",           -- Config
        "markdown", "markdown_inline",    -- Docs
        "bash",                           -- Shell
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        -- Disable for large files (performance)
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
        disable = { "yaml" }, -- Better indent elsewhere
      },
    })

    -- Treesitter context (show current function/class at top)
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,
      mode = "cursor",
    })
  end,
}
