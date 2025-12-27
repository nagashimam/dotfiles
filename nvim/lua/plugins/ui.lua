-- UI components and dependencies for CodeCompanion and other plugins
return {
  -- Dressing.nvim: Better UI for inputs/selects (CodeCompanion dependency)
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Devicons: File icons (CodeCompanion + Telescope)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- NUI: UI components library (CodeCompanion dependency)
  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },
}
