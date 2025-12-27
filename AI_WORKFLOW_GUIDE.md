# AI-Integrated Terminal Workflow Guide

How to use AI tools (Claude Code, Gemini, Avante) while minimizing context switching in your terminal setup.

## 🎯 Goal: Stay in Terminal

With Zellij + Neovim + AI tools, you can code entirely in the terminal without switching to browsers or GUIs.

---

## 🖥️ Recommended Zellij Layout

Create a layout optimized for AI-assisted development:

```
┌─────────────────────────┬──────────────────┐
│                         │                  │
│                         │  AI Assistant    │
│   Neovim                │  (Avante Chat)   │
│   (Main Editor)         │  Or              │
│   70%                   │  Terminal        │
│                         │  (Claude/Gemini) │
│                         │  30%             │
├─────────────────────────┼──────────────────┤
│  Terminal (Git/Tests)   │  File Tree       │
│  15%                    │  (Optional) 15%  │
└─────────────────────────┴──────────────────┘
```

### Quick Pane Navigation
- `Alt+h` - Move left
- `Alt+l` - Move right
- `Alt+j` - Move down
- `Alt+k` - Move up

**No mode switching needed!** Alt keybindings work from anywhere.

---

## 🤖 Three AI Tools - When to Use Each

### 1. Avante.nvim (Inside Neovim)
**Best for**: Code you're actively editing

**Workflow**:
```
1. Edit code in Neovim
2. Press <leader>aa to open Avante sidebar
3. Ask question or request change
4. Review diff inline
5. Accept or modify
6. Continue coding
```

**Use when**:
- Refactoring current file
- Explaining code you're reading
- Quick inline suggestions
- Want to see changes immediately

**Pros**: Zero context switch, inline diffs, visual
**Cons**: Requires API key setup

---

### 2. Claude Code CLI (Terminal Pane)
**Best for**: Multi-file operations, project-level changes

**Workflow**:
```
1. Alt+l to switch to terminal pane
2. Run: claude "add error handling to all API calls"
3. Claude analyzes entire project
4. Makes changes across files
5. Alt+h to switch back to Neovim
6. Review changes with git diff
```

**Use when**:
- Adding features across multiple files
- Refactoring entire modules
- Generating boilerplate
- Complex architectural changes

**Pros**: Understands entire codebase, autonomous
**Cons**: Less control, need to review carefully

**Setup**:
Already installed! Just use it.

---

### 3. Gemini CLI (Terminal Pane)
**Best for**: Quick questions, documentation lookup, learning

**Installation**:
```bash
npm install -g @google/generative-ai-cli
```

**Setup in Fish** (add to `~/.config/fish/config.fish`):
```fish
# Quick Gemini access
function gm
    gemini-cli $argv
end

# Vue.js specific help
function gvue
    gemini-cli "Vue.js 3 Composition API: $argv"
end

# Go specific help
function ggo
    gemini-cli "Go programming: $argv"
end

# Explain error messages
function gerr
    gemini-cli "Explain this error and how to fix it: $argv"
end
```

**Workflow**:
```
1. Alt+l to terminal pane
2. Run: gvue "how to use computed properties"
3. Read explanation
4. Alt+h back to Neovim
5. Apply what you learned
```

**Use when**:
- Learning Vue.js or Go concepts
- Quick API reference
- Error message explanation
- "How do I..." questions

**Pros**: Free tier, fast, great for learning
**Cons**: No file editing, conversation only

---

## 📋 Workflow Scenarios

### Scenario 1: Learning New Vue.js Concept
**Goal**: Understand Vue 3 Composition API while coding

**Steps**:
1. **Neovim**: Open `.vue` file you're working on
2. **Terminal (Gemini)**: `Alt+l` then `gvue "explain reactive vs ref"`
3. **Read**: Gemini explains the difference
4. **Neovim**: `Alt+h` back, try implementing
5. **Avante**: `<leader>aa` ask "Convert this to use ref instead of reactive"
6. **Review**: See inline diff, accept changes
7. **Done**: Continue coding

**Time**: ~2 minutes, zero GUI switches

---

### Scenario 2: Debugging Go Error
**Goal**: Fix compiler error you don't understand

**Steps**:
1. **Neovim**: See error with `]]` (next diagnostic)
2. **Terminal (Gemini)**: `Alt+l` then `gerr "undefined: http.HandlerFunc"`
3. **Read**: Gemini explains missing import
4. **Neovim**: `Alt+h` back
5. **LSP**: Press `<leader>c` (code action) → "Add import"
6. **Or Copilot**: Start typing `import` and accept suggestion
7. **Done**: Error resolved

**Time**: ~1 minute

---

### Scenario 3: Adding Feature Across Files
**Goal**: Add authentication to your Vue app

**Steps**:
1. **Claude Code**: In terminal pane:
   ```
   claude "Add JWT authentication to the Vue app:
   - Create auth store using Pinia
   - Add login/logout components
   - Add auth middleware for routes
   - Update API calls to include token"
   ```
2. **Wait**: Claude creates multiple files
3. **Review**: `Alt+h` to Neovim, use `<leader>g` to grep changes
4. **Git**: In terminal: `git diff` to see all changes
5. **Test**: Run app, test authentication
6. **Refine**: Use Avante (`<leader>aa`) to tweak specific files
7. **Commit**: Terminal: `git add . && git commit -m "Add auth"`

**Time**: ~10 minutes for complex feature

---

### Scenario 4: Code Review Before Commit
**Goal**: Review your changes with AI before committing

**Steps**:
1. **Git**: Terminal pane: `git add .`
2. **Claude Code**: `claude "Review these changes and suggest improvements"`
3. **Read**: Claude's feedback in terminal
4. **Fix**: `Alt+h` to Neovim, make changes
5. **Or Avante**: `<leader>aa` "Apply the suggested improvements"
6. **Commit**: Terminal: `git commit -m "message"`

**Time**: ~3-5 minutes

---

### Scenario 5: Refactoring Single File
**Goal**: Clean up a messy Vue component

**Steps**:
1. **Neovim**: Open component
2. **Avante**: `<leader>aa`
3. **Ask**: "Refactor this component to:
   - Extract computed properties
   - Simplify template logic
   - Add TypeScript types
   - Split into smaller components if needed"
4. **Review**: Inline diff shows changes
5. **Accept**: Or modify before accepting
6. **Format**: `<leader>o` to format
7. **Done**: Save with `:w`

**Time**: ~2 minutes

---

## 🎨 Optimal Terminal Setup

### Step 1: Create Zellij Session
```bash
zellij -s dev
```

### Step 2: Set Up Panes
```
1. Main pane (large): nvim
2. Right pane (medium): Terminal for AI commands
3. Bottom left (small): Git/tests
4. Bottom right (small): File explorer (optional)
```

### Step 3: Navigate Efficiently
Use `Alt+hjkl` - works even when Neovim is in insert mode!

---

## 🚀 Pro Tips

### 1. AI Tool Selection Decision Tree
```
Need to edit code I'm viewing?
  → Use Avante (in Neovim)

Need multi-file changes?
  → Use Claude Code (terminal)

Need to learn something?
  → Use Gemini (terminal)

Need inline completion?
  → Use Copilot (automatic in Neovim)
```

### 2. Combine Tools
Don't limit yourself to one tool:
```
1. Gemini: Learn concept
2. Copilot: Get code suggestions
3. Avante: Refine specific parts
4. Claude Code: Apply to whole project
```

### 3. Save Context with Notes
Keep a scratchpad in Neovim:
```bash
# Open in Neovim split
:vsplit ~/notes/current-task.md

# Document:
- AI suggestions you liked
- Patterns you're learning
- Questions for later
```

### 4. Use Avante for Code Reading
Not just writing! When reading unfamiliar code:
```
1. Highlight complex function
2. <leader>aa
3. Ask: "What does this function do?"
4. Or: "Explain this algorithm step by step"
```

### 5. Leverage Git Integration
```
# Before commit
:Gitsigns preview_hunk  # or <leader>hp

# Ask AI about your changes
Claude: "Review this hunk for issues"
```

---

## ⚡ Hotkey Summary for Minimal Context Switching

| Action | Keys | Time |
|--------|------|------|
| Switch to AI terminal | `Alt+l` | 0s |
| Back to editor | `Alt+h` | 0s |
| Open AI chat in editor | `<leader>aa` | 0s |
| Accept AI suggestion | `Ctrl+i` | 0s |
| Find file | `<leader>f` | 1s |
| Search code | `<leader>g` | 1s |
| Git status | `]c` | 0s |

**Everything under 1 second!** No mouse, no window switching, no GUI.

---

## 🎯 Daily Workflow Example

**Morning: Starting Vue.js feature**
```
8:00 - Open Zellij session
8:01 - nvim in main pane
8:02 - gvue "best practices for Vue 3 composables" in terminal
8:05 - Read Gemini response
8:06 - Start coding with Copilot suggestions
8:15 - <leader>aa "Refactor to use composable pattern"
8:20 - Feature mostly done, minor tweaks
```

**Afternoon: Go backend work**
```
2:00 - Switch to Go project
2:01 - ggo "error handling best practices"
2:05 - Start implementing
2:10 - Copilot suggests similar patterns - accept
2:15 - Hit error: gerr [paste error]
2:16 - Fix based on Gemini explanation
2:20 - Claude Code: "Add unit tests for these functions"
2:25 - Review tests, make minor edits with Avante
```

**Evening: Code review and commit**
```
5:00 - git diff to review day's work
5:02 - Claude Code: "Review and suggest improvements"
5:05 - Apply suggestions with Avante
5:10 - git commit with Claude-suggested message
5:15 - Done! No context switching to browser all day
```

---

## 🔧 Troubleshooting

### "I keep forgetting which AI to use"
**Solution**:
- Default to Avante for files you're editing
- Use Claude Code for project-level tasks
- Use Gemini for questions

### "Too much pane switching"
**Solution**:
- Master `Alt+hjkl` - it's instant
- Or just use Avante and stay in Neovim
- Close panes you're not using

### "AI suggestions are distracting"
**Solution**:
```vim
" Disable Copilot temporarily
:Copilot disable

" Re-enable when needed
:Copilot enable
```

### "Gemini responses too long"
**Solution**:
```fish
# Add to your gm function
function gm
    gemini-cli --max-tokens 500 $argv
end
```

---

## 📈 Measuring Success

After 1 week, you should:
- ✅ Never open a browser for coding questions
- ✅ Stay in terminal 95% of time
- ✅ Use AI naturally without thinking
- ✅ Navigate panes without looking at keyboard
- ✅ Know which AI tool to use instantly

After 1 month:
- ✅ Muscle memory for all keybindings
- ✅ AI assists 50%+ of your coding
- ✅ Context switching < 5 times per day
- ✅ Coding velocity noticeably faster

---

## 🎓 Next Level

Once comfortable:
1. Create custom Avante prompts for common tasks
2. Build Fish functions for domain-specific AI queries
3. Set up project-specific .nvim.lua with AI templates
4. Contribute your workflow back to community

---

**Remember**: The goal is flow state. Minimize context switching, maximize AI assistance, stay in your terminal. You've got all the tools - now practice! 🚀
