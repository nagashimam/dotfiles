-- CodeCompanion: Primary AI assistant for code understanding
-- Configured with Claude API, Gemini CLI, GitHub Copilot, and Claude Code (ACP)
return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "stevearc/dressing.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("codecompanion").setup({
      -- Adapter Strategy: Use Claude for chat, Copilot for inline
      strategies = {
        chat = { adapter = "anthropic" },    -- Default to Claude API for understanding
        inline = { adapter = "copilot" },    -- Copilot for quick inline edits
        cmd = { adapter = "anthropic" },     -- Claude for command-line prompts
      },

      -- Configure all four adapters
      adapters = {
        -- 1. Claude API (Anthropic)
        anthropic = function()
          return require("codecompanion.adapters").extend("anthropic", {
            env = {
              api_key = "ANTHROPIC_API_KEY",  -- Read from environment
            },
            schema = {
              model = {
                default = "claude-sonnet-4-20250514",
              },
            },
          })
        end,

        -- 2. Gemini CLI (via Gemini API)
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "GEMINI_API_KEY",
            },
            schema = {
              model = {
                default = "gemini-2.0-flash-exp",
              },
            },
          })
        end,

        -- 3. GitHub Copilot (assumes copilot.lua installed)
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "gpt-4o-2024-05-13",
              },
            },
          })
        end,
      },

      -- CLAUDE.md Rules File Integration
      -- CodeCompanion auto-detects CLAUDE.md in project root
      -- Enable with :CodeCompanionRulesEnable
      -- Disable with :CodeCompanionRulesDisable

      -- Display Configuration
      display = {
        diff = {
          provider = "mini_diff",  -- Lightweight diff provider
        },
        chat = {
          window = {
            layout = "vertical",   -- Vertical split for chat
            width = 0.3,          -- 30% of screen width
            relative = "editor",
          },
          show_settings = true,   -- Show model/adapter settings in chat
        },
      },

      -- Slash Commands for Code Understanding
      slash_commands = {
        -- Built-in commands available:
        -- /explain - Explain selected code
        -- /lsp - Include LSP diagnostics
        -- /symbols - Include buffer symbols
        -- /help - Show all available slash commands

        -- Custom slash command for architecture analysis
        ["architecture"] = {
          description = "Analyze code architecture and design patterns",
          opts = {
            contains_code = true,
            user_prompt = true,
          },
          prompts = {
            {
              role = "system",
              content = "You are an expert software architect. Analyze the code for design patterns, architectural decisions, and idioms. Explain the 'why' behind the structure.",
            },
          },
        },
      },

      -- Code Understanding Prompts
      prompt_library = {
        ["Explain Code"] = {
          strategy = "chat",
          description = "Explain what this code does",
          opts = {
            short_name = "explain",
            auto_submit = true,
            user_prompt = false,
          },
          prompts = {
            {
              role = "system",
              content = "Explain this code clearly. Focus on: 1) What it does, 2) How it works, 3) Why it's structured this way, 4) Any design patterns or idioms used.",
            },
          },
        },
        ["Design Patterns"] = {
          strategy = "chat",
          description = "Identify design patterns in code",
          opts = {
            short_name = "patterns",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = "Analyze this code for design patterns, architectural decisions, and common idioms. Explain each pattern found and why it might have been chosen.",
            },
          },
        },
        ["Code Review"] = {
          strategy = "chat",
          description = "Review code for understanding",
          opts = {
            short_name = "review",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = "Review this code focusing on: 1) Code structure and organization, 2) Readability and maintainability, 3) Potential edge cases, 4) Suggestions for better understanding.",
            },
          },
        },
      },

      -- Performance optimizations
      opts = {
        log_level = "WARN",              -- Reduce logging overhead
        send_code = true,                -- Include code context
        use_default_actions = true,      -- Enable built-in actions
        use_default_prompt_library = true, -- Include built-in prompts
      },
    })
  end,
}
