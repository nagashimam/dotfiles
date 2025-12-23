return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		-- Provider-agnostic setup - switch by changing this value
		provider = "copilot", -- "claude", "openai", "gemini", "copilot"
		auto_suggestions_provider = "copilot", -- Use Copilot for inline suggestions

		-- NEW: Provider configurations (migrated format)
		providers = {
			-- Claude configuration
			claude = {
				endpoint = "https://api.anthropic.com",
				model = "claude-sonnet-4-20250514",
				-- Read API key from environment variable
				api_key_name = "cmd:echo $ANTHROPIC_API_KEY",
				-- Temperature and max_tokens moved to extra_request_body
				extra_request_body = {
					temperature = 0,
					max_tokens = 4096,
				},
			},

			-- Gemini configuration
			gemini = {
				endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
				model = "gemini-2.5-flash",
				-- Read API key from your env.sh file
				api_key_name = "cmd:echo $GEMINI_API_KEY",
				extra_request_body = {
					temperature = 0,
					max_tokens = 4096,
				},
			},

			-- Copilot configuration (for chat, not completions)
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "gpt-4o-2024-05-13",
				extra_request_body = {
					temperature = 0,
					max_tokens = 4096,
				},
			},
		},

		-- MCP integration: Inject active MCP server info into system prompt
		system_prompt = function()
			local hub = require("mcphub").get_hub_instance()
			return hub and hub:get_active_servers_prompt() or ""
		end,

		-- MCP integration: Add custom tools for MCP server interaction
		custom_tools = function()
			return {
				require("mcphub.extensions.avante").mcp_tool(),
			}
		end,

		behaviour = {
			auto_suggestions = false, -- Disable to avoid conflict with Copilot plugin
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false, -- Manual review recommended
			support_paste_from_clipboard = true,
			enable_token_counting = true, -- Monitor token usage to avoid rate limits
		},

		-- History management to reduce token consumption
		history = {
			max_tokens = 2048, -- Limit history tokens (default: 4096)
			carried_entry_count = 5, -- Only carry last 5 exchanges (default: unlimited)
			storage_path = vim.fn.stdpath("state") .. "/avante",
		},

		mappings = {
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				all_theirs = "ca",
				both = "cb",
				cursor = "cc",
				next = "]x",
				prev = "[x",
			},
			suggestion = {
				accept = "<M-l>", -- Alt+l to accept
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<C-]>",
			},
			jump = {
				next = "]c",
				prev = "[c",
			},
		},

		hints = { enabled = true },
		windows = {
			---@type "right" | "left" | "top" | "bottom"
			position = "right", -- AI chat on the right side
			wrap = true,
			width = 30, -- Width percentage
			sidebar_header = {
				align = "center",
				rounded = true,
			},
		},
		highlights = {
			---@type AvanteConflictHighlights
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
		--- @class AvanteConflictUserConfig
		diff = {
			autojump = true,
			---@type string | fun(): any
			list_opener = "copen",
		},
	},

	-- Build step (required for some features)
	build = "make",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- Optional dependencies
		"nvim-tree/nvim-web-devicons", -- For file icons
		"zbirenbaum/copilot.lua", -- For copilot auto-suggestions
		{
			-- Support image pasting in chat
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
		{
			-- Markdown rendering for better chat readability
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
