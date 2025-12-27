# Neovim AI-Enhanced Setup Guide

This guide will help you complete the setup of your new AI-enhanced Neovim configuration.

## Prerequisites

You need API keys for the AI providers you want to use:

1. **Claude (Anthropic)** - For high-quality code assistance
   - Get API key from: https://console.anthropic.com/
   - Add to your shell environment

2. **Gemini (Google)** - Already have! (in env.sh)

3. **GitHub Copilot** - For inline completions
   - Requires GitHub Copilot subscription ($10/month)
   - Authentication happens through GitHub CLI

## Step-by-Step Setup

### 1. Set Up Environment Variables

Edit your `~/.config/env.sh` file to add the Claude API key:

```bash
# Add this line (replace with your actual key)
export ANTHROPIC_API_KEY="your-anthropic-api-key-here"

# Your existing Gemini key (already there)
export GEMINI_API_KEY=XXXX
```

Then reload your shell:
```bash
source ~/.config/env.sh
```

### 2. Install Neovim Plugins

Open Neovim:
```bash
nvim
```

Lazy.nvim will automatically detect the new plugins and prompt you to install them.
Or manually trigger installation:
```
:Lazy sync
```

This will install:
- ✓ avante.nvim (AI chat)
- ✓ copilot.lua (inline completions)
- ✓ nvim-treesitter (syntax)
- ✓ which-key.nvim (keybinding helper)
- ✓ gitsigns.nvim (git integration)

**Note**: The first time may take 5-10 minutes to download and compile everything.

### 3. Set Up GitHub Copilot (if you have subscription)

In Neovim, run:
```
:Copilot auth
```

This will:
1. Open a browser window
2. Show you a code
3. Prompt you to authenticate with GitHub
4. Link Copilot to Neovim

After authentication completes, check status:
```
:Copilot status
```

### 4. Install LSP Servers and Tools

Mason will auto-install tools, but you can verify/trigger manually:

```
:Mason
```

Ensure these are installed (checkmark):
- ts_ls (TypeScript/JavaScript - also handles Vue.js)
- gopls (Go)
- lua_ls (Lua)
- biome (JSON/YAML formatter)
- prettier (JS/TS/CSS/HTML/Vue formatter)
- eslint_d (JS/TS linter)
- stylua (Lua formatter)
- goimports, gofumpt (Go tools)

### 5. Test Each Feature

#### Test AI Chat (Avante)
1. Open any code file
2. Press `<leader>aa` (space + a + a) to open Avante chat
3. Type a question: "Explain this code"
4. Hit Enter to send

**Switch AI providers**:
- Edit `nvim/lua/plugins/ai-avante.lua`
- Change `provider = "claude"` to `provider = "gemini"` or `provider = "copilot"`
- Reload config: `:Lazy reload avante.nvim`

#### Test Copilot Completions
1. Open a `.js`, `.ts`, `.vue`, or `.go` file
2. Start typing a function
3. Wait for gray suggestion text to appear
4. Press `Ctrl+i` to accept suggestion
5. Press `Ctrl+l` for next suggestion, `Ctrl+h` for previous

#### Test Vue.js Support
1. Create a test file: `test.vue`
2. Type `<script setup>` and press Enter
3. You should see autocomplete and syntax highlighting from ts_ls
4. Test hover with `<leader>h` on Vue-specific syntax
5. Format with `<leader>o` (uses prettier)

#### Test Go Support
1. Create a test file: `test.go`
2. Type `func main() {`
3. You should see autocomplete from gopls
4. Test go-to-definition with `]d`
5. Save file - gopls automatically formats with gofumpt and manages imports

#### Test Which-Key
1. Press `<leader>` (space)
2. Wait 500ms
3. Popup should show all available keybindings
4. No more forgetting shortcuts!

#### Test Gitsigns
1. Make a change to a tracked file
2. You should see `│` in the left column (sign column)
3. Press `]h` to jump to next change (Note: `]c` is for treesitter class navigation)
4. Press `<leader>hp` to preview the change
5. Press `<leader>hb` to see git blame

## Essential Keybindings

### AI Assistance
- `<leader>aa` - Toggle Avante AI chat
- `Ctrl+i` - Accept Copilot suggestion
- `Ctrl+l` / `Ctrl+h` - Next/previous Copilot suggestion
- `Ctrl+q` - Dismiss Copilot suggestion

### Code Navigation
- `]d` - Go to definition
- `]r` - Go to references
- `]t` - Go to type definition
- `<leader>h` - Hover documentation
- `<leader>r` - Rename symbol
- `<leader>c` - Code action
- `<leader>o` - Format code

### Fuzzy Finding (Telescope)
- `<leader>f` - Find files
- `<leader>g` - Grep in files
- `<leader>e` - Grep by file extension
- `<leader>bf` - Find in open buffers

### Git (Gitsigns)
- `]h` / `[h` - Next/previous git change
- `<leader>hp` - Preview git hunk
- `<leader>hb` - Git blame line
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk

### Diagnostics
- `[[` - Previous diagnostic
- `]]` - Next diagnostic
- `<leader>d` - Show diagnostic in float

### Treesitter Navigation
- `]c` / `[c` - Next/previous class
- `]m` / `[m` - Next/previous function

### Which-Key Helper
- `<leader>?` - Show all buffer keymaps
- Press `<leader>` and wait to see options

### Treesitter Text Objects
- `vaf` - Select outer function
- `vif` - Select inner function
- `vac` - Select outer class
- `vic` - Select inner class
- `<CR>` (in visual mode) - Expand selection
- `<BS>` (in visual mode) - Shrink selection

## Switching AI Providers

You can easily switch between Claude, Gemini, and Copilot:

**Edit**: `~/.config/nvim/lua/plugins/ai-avante.lua`

**Change this line**:
```lua
provider = "claude",  -- Change to "gemini" or "copilot"
```

**Then reload**:
```
:Lazy reload avante.nvim
```

**Recommendation**:
- Use **Claude** for complex refactoring and code reviews
- Use **Gemini** for quick questions and learning (free tier!)
- Use **Copilot** for chat if you prefer GitHub ecosystem

## Expected Warnings (Safe to Ignore)

### ~~LSP Deprecation Warning~~ (Already Fixed!)
~~You may see: `The 'require("lspconfig")' "framework" is deprecated`~~

**Update**: This warning has been fixed! The configuration now uses `vim.lsp.config` (the new Neovim 0.11+ API) instead of the deprecated `require("lspconfig")` method.

## Troubleshooting

### Avante won't start
- Check API key is set: `echo $ANTHROPIC_API_KEY` or `echo $GEMINI_API_KEY`
- Verify provider in config matches your API key
- Check `:Lazy` shows avante.nvim is loaded
- Look for errors: `:messages`

### Copilot not working
- Verify authentication: `:Copilot status`
- If not authenticated: `:Copilot auth`
- Check you have active subscription
- Try: `:Copilot disable` then `:Copilot enable`

### LSP not working for Vue
- Check vue_ls is installed: `:Mason`
- Verify `.vue` file is detected: `:set filetype?` (should say `vue`)
- Check LSP is attached: `:LspInfo`
- Try: `:LspRestart`

### LSP not working for Go
- Check gopls is installed: `:Mason`
- Verify `.go` file is detected: `:set filetype?` (should say `go`)
- Check LSP is attached: `:LspInfo`
- Install Go tools if needed: `go install golang.org/x/tools/gopls@latest`

### Treesitter syntax highlighting issues
- Update parsers: `:TSUpdate`
- Check installed parsers: `:TSInstallInfo`
- For Vue: `:TSInstall vue`
- For Go: `:TSInstall go`

### which-key not showing
- Check timeout setting: `set timeoutlen?` (should be 300)
- Try pressing `<leader>` and waiting 500ms
- Check it's loaded: `:Lazy`

### Performance issues
- Disable some plugins temporarily
- Check startup time: `nvim --startuptime startup.log`
- Consider lazy-loading more aggressively

## Next Steps

After setup is complete:

1. **Practice keybindings**: Use which-key to discover shortcuts
2. **Try AI chat**: Ask Avante to explain complex code
3. **Test Copilot**: Write a new function and see suggestions
4. **Learn Vue.js**: Open a `.vue` file and explore autocomplete
5. **Write Go code**: Try LSP features in a `.go` file
6. **Customize**: Adjust keybindings to your preference

## File Structure

Your new plugin files:
```
~/.config/nvim/lua/plugins/
├── ai-avante.lua          # AI chat (Claude/Gemini/Copilot)
├── copilot.lua            # GitHub Copilot inline completions
├── treesitter.lua         # Syntax highlighting
├── which-key.lua          # Keybinding helper
├── gitsigns.lua           # Git integration
├── lsp.lua                # Updated with Vue.js support
└── mason-tool-installer.lua  # Updated with vue-language-server
```

## Time Estimate

- Initial plugin installation: 5-10 minutes
- LSP/Mason setup: 2-5 minutes
- Copilot authentication: 2 minutes
- Testing features: 10-15 minutes
- Learning keybindings: 30-60 minutes

**Total: ~1-2 hours** (within your 2-3 hour budget!)

## Resources

- Avante docs: https://github.com/yetone/avante.nvim
- Copilot docs: https://github.com/zbirenbaum/copilot.lua
- Vue.js Language Tools: https://github.com/vuejs/language-tools
- Neovim LSP: `:help lsp`
- Treesitter: `:help treesitter`

## Getting Help

If you encounter issues:
1. Check `:checkhealth` for general Neovim health
2. Check `:Lazy` for plugin status
3. Check `:Mason` for LSP server status
4. Read `:messages` for error messages
5. Try `:LspInfo` for LSP-specific issues

Enjoy your new AI-enhanced development environment! 🚀
