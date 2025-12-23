# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managing personal configuration files for:
- **Neovim**: Lua-based configuration using lazy.nvim plugin manager
- **Fish Shell**: Interactive shell with custom prompt and fzf integration
- **Zellij**: Terminal multiplexer with custom keybindings

## Neovim Configuration Architecture

The Neovim configuration follows a modular structure:

- `nvim/init.lua` - Entry point that loads core modules
- `nvim/lua/core/` - Core configuration
  - `option.lua` - Vim options, built-in plugin disabling, and WSL clipboard integration (win32yank)
  - `keymap.lua` - Global keymaps (leader: space)
  - `lazy.lua` - lazy.nvim plugin manager setup
- `nvim/lua/plugins/` - Plugin configurations (each plugin in its own file)

### Key Plugin Stack

- **LSP**: `vim.lsp.config` (Neovim 0.11+ native API) with `mason.nvim` and `mason-lspconfig`
  - Auto-installed servers: ts_ls, biome, jsonls, yamlls, emmet_ls, gopls, lua_ls
  - Vue.js support: ts_ls with `@vue/typescript-plugin` (no separate vue_ls)
  - gopls configured with `gofumpt = true` for Go formatting
- **Formatting**: `conform.nvim` with format-on-save enabled
  - JavaScript/TypeScript/CSS/HTML/Vue: prettier
  - JSON/YAML: biome
  - Lua: stylua
  - Go: handled by gopls (imports + gofumpt formatting via LSP)
- **Linting**: `nvim-lint` with auto-linting on BufWritePost
  - JavaScript/TypeScript/CSS/HTML: eslint_d
  - Lua: luacheck (configured to recognize `vim` global)
- **Completion**: `nvim-cmp` with LSP, buffer, and path sources
- **Fuzzy Finder**: `telescope.nvim` with fzf-native extension
- **Treesitter**: Code highlighting and navigation with `treesitter-textobjects` and `treesitter-context`
- **AI Integration**: `avante.nvim` for Gemini/Claude integration with token limiting
- **Dev Tools**: `lazydev.nvim` for better Lua development, `gitsigns.nvim` for git integration
- **Auto-install Tools**: `mason-tool-installer.nvim` ensures biome, stylua, prettier, goimports, gofumpt, eslint_d, shellcheck

### Important Neovim Keymaps

Navigation:
- `]d` - Go to definition
- `]r` - Go to references
- `]t` - Go to type definition
- `[[` / `]]` - Previous/next diagnostic
- `]c` / `[c` - Next/previous class (treesitter)
- `]m` / `[m` - Next/previous function (treesitter)

Leader commands (space):
- `<leader>f` - Find files (Telescope)
- `<leader>g` - Live grep (Telescope)
- `<leader>e` - Grep by extension (custom function)
- `<leader>h` - Hover documentation
- `<leader>r` - Rename symbol
- `<leader>c` - Code action
- `<leader>o` - Format code (LSP fallback)
- `<leader>m` - Manual format (conform.nvim)
- `<leader>d` - Show diagnostic float

### Working with Neovim Config

When modifying plugins:
- Each plugin should be in its own file in `nvim/lua/plugins/`
- Plugin files should return a lazy.nvim spec table
- Use `event`, `keys`, or `cmd` for lazy loading when appropriate
- The `lazy-lock.json` file is git-ignored (as per recent commits)

## Fish Shell Configuration

- `fish/config.fish` - Main config with `nv` alias for nvim
- `fish/functions/fish_prompt.fish` - "Ocean" theme with git integration
- `fish/conf.d/fzf.fish` - fzf integration for history, directory search, git operations
- `fish/functions/fish_user_key_bindings.fish` - Custom keybindings

The fish config sources `~/.config/env.sh` for environment variables.

## Zellij Configuration

- `zellij/config.kdl` - Custom keybindings with `default_mode "locked"`
- Scrollback editor set to `/usr/bin/nvim`
- Vim-style navigation (hjkl) in all modes

## Development Environment Notes

- **Platform**: WSL2 (Linux on Windows)
- **Clipboard**: Uses win32yank.exe for WSL-Windows clipboard integration
- **Git**: Branch strategy visible in commits (feature branches merged via PRs)
- **Primary Language Focus**: JavaScript/TypeScript (Vue.js) and Go

## Common Patterns

1. **Neovim Performance**: Recent commits show focus on lazy loading and startup optimization
2. **Tool Consistency**:
   - Prettier for JavaScript/TypeScript formatting
   - ESLint for JavaScript/TypeScript linting
   - Biome for JSON/YAML formatting
   - gopls with gofumpt for Go (LSP-driven)
3. **Vim Keybindings**: Consistent hjkl navigation across Neovim and Zellij
4. **LSP-First Approach**: Let language servers handle formatting when possible (especially Go)

## What I want you to do with this repository

You're developer experience engineer who is skilled at setting up smooth terminal enviroment.

I'm a web engineer. Help me renew my development enviromnent. If there're other tools that help me achieve the goals below within the mentioned context, suggest tools other than the ones I'm currently using

### Goals of this renewal

- Integrate my workflow with AI Agents
- Less context switch. I want to stay within my terminal as much as possible. 

### Background context 

Below are contexts to the configuration

- I'll use Vue.js and Go in my next position, but I'm new to both of them. 
  - I need better support for reading and writing codes, but I cannot handle complex settings
- I prefer developing on Neovim rather than on IDEs
- I want to use some kinds of terminal multiplexer while I code
  - I cannot remember how to use Tmux
  - I currently use Zellij because it shows key bindings at the bottom of screen so I don't have to remember them
  - If similar mechanisms to remind me of key bindings, I'm open to alternative terminal multiplexer
- I use Gemini and Claude Code to write codes. I use Neovim to read codes
  - I want better integration for reading codes oon Neovim while I use AI agents such as Gemini and Claude Code as assistance
