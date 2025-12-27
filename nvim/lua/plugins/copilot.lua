-- GitHub Copilot for inline code suggestions
return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",     -- Accept suggestion
          next = "<C-]>",       -- Next suggestion
          prev = "<C-[>",       -- Previous suggestion
          dismiss = "<C-e>",    -- Dismiss suggestion
        },
      },
      filetypes = {
        yaml = false,
        markdown = true,
        javascript = true,
        typescript = true,
        vue = true,
        go = true,
        lua = true,
      },
    })
  end,
}
