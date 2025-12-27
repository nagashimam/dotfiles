-- Which-key for keymap documentation and discoverability
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    delay = 500,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Document keybinding groups
    wk.add({
      -- CodeCompanion (will be populated when keymaps are added)
      { "<leader>c", group = "AI/Code" },

      -- Telescope
      { "<leader>f", group = "Find" },
      { "<leader>ff", desc = "Find files" },
      { "<leader>fg", desc = "Live grep" },
      { "<leader>fb", desc = "Find buffers" },
      { "<leader>fh", desc = "Help tags" },
      { "<leader>fs", desc = "Document symbols" },
      { "<leader>fr", desc = "LSP references" },

      -- LSP
      { "<leader>l", group = "LSP" },
      { "<leader>ld", desc = "Show diagnostics" },
      { "gd", desc = "Go to definition" },
      { "gr", desc = "Find references" },
      { "gt", desc = "Go to type definition" },
      { "K", desc = "Hover documentation" },
      { "[d", desc = "Previous diagnostic" },
      { "]d", desc = "Next diagnostic" },
    })
  end,
}
