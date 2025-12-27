# Neovim Keybindings Cheatsheet

Quick reference for your AI-enhanced Neovim setup.

## 🤖 AI Assistance

| Key | Action |
|-----|--------|
| `<leader>aa` | Toggle Avante AI chat sidebar |
| `Ctrl+i` | Accept Copilot/AI suggestion |
| `Ctrl+l` | Next Copilot suggestion |
| `Ctrl+h` | Previous Copilot suggestion |
| `Ctrl+q` | Dismiss Copilot suggestion |

**Tip**: Press `<leader>` (space) and wait to see all available options!

---

## 🔍 Finding & Navigation

### Telescope (Fuzzy Finder)
| Key | Action |
|-----|--------|
| `<leader>f` | Find files |
| `<leader>g` | Live grep (search in files) |
| `<leader>e` | Grep by file extension |
| `<leader>bf` | Find in open buffers |
| `<leader>br` | Find git branches |

### LSP Navigation
| Key | Action |
|-----|--------|
| `]d` | Go to definition |
| `]r` | Go to references |
| `]t` | Go to type definition |
| `<leader>h` | Hover documentation |
| `<leader>r` | Rename symbol |
| `<leader>c` | Code action |
| `<leader>o` | Format code (LSP) |
| `<leader>m` | Manual format (conform) |

### Diagnostics (Errors/Warnings)
| Key | Action |
|-----|--------|
| `[[` | Previous diagnostic |
| `]]` | Next diagnostic |
| `<leader>d` | Show diagnostic float |

### Treesitter Navigation
| Key | Action |
|-----|--------|
| `]m` | Next function start |
| `[m` | Previous function start |
| `]M` | Next function end |
| `[M` | Previous function end |
| `]c` | Next class start |
| `[c` | Previous class start |

---

## 📝 Text Objects (Treesitter)

### Visual Mode Selection
| Key | Action |
|-----|--------|
| `vaf` | Select outer function |
| `vif` | Select inner function |
| `vac` | Select outer class |
| `vic` | Select inner class |
| `vaa` | Select outer parameter |
| `via` | Select inner parameter |

### Incremental Selection
| Key | Action | Mode |
|-----|--------|------|
| `<CR>` | Expand selection | Visual |
| `<S-CR>` | Expand scope incrementally | Visual |
| `<BS>` | Shrink selection | Visual |

---

## 🌿 Git (Gitsigns)

### Navigation
| Key | Action |
|-----|--------|
| `]h` | Next git hunk (change) |
| `[h` | Previous git hunk |

**Note**: `]c`/`[c` are used for treesitter class navigation

### Actions
| Key | Action |
|-----|--------|
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Git blame line |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hd` | Diff this |
| `<leader>hD` | Diff vs previous commit (~) |
| `<leader>tb` | Toggle line blame |
| `<leader>td` | Toggle deleted lines |

### Text Object
| Key | Action | Mode |
|-----|--------|------|
| `ih` | Git hunk text object | Visual/Operator |

**Usage**: `vih` (select hunk), `dih` (delete hunk), `yih` (yank hunk)

---

## ⌨️ General Neovim

### Your Custom Keybindings
| Key | Action |
|-----|--------|
| `jj` | Exit insert mode |
| `k` / `j` | Move up/down (visual lines) |
| `<leader>j` | Jump forward (Ctrl-i) |
| `<leader>k` | Jump backward (Ctrl-o) |
| `<leader>,` | Clear search highlight |

### Essential Vim
| Key | Action |
|-----|--------|
| `i` | Insert mode |
| `v` | Visual mode |
| `V` | Visual line mode |
| `Ctrl+v` | Visual block mode |
| `Esc` | Normal mode |
| `:w` | Save |
| `:q` | Quit |
| `:wq` | Save and quit |

---

## 🔑 Which-Key Helper

| Key | Action |
|-----|--------|
| `<leader>` + wait | Show all leader keybindings |
| `<leader>?` | Show buffer-local keybindings |

**Remember**: Leader key is `Space`!

---

## 🎯 Pro Tips

1. **Don't memorize everything**: Press `<leader>` and wait 500ms to see options
2. **AI assistance**: When stuck, open Avante (`<leader>aa`) and ask questions
3. **Quick jumps**: Use `]d` to jump to definition, then `<leader>k` to jump back
4. **Git workflow**: `]c` to find changes, `<leader>hp` to preview, `<leader>hs` to stage
5. **Text selection**: Use `vaf` to select entire function, then `y` to yank (copy)
6. **Search and edit**: `<leader>g` to grep, `]r` to find all references
7. **Copilot suggestions**: If suggestion is wrong, use `Ctrl+l` to see alternatives

---

## 🚀 Workflow Examples

### AI-Assisted Coding
```
1. Write function stub
2. Wait for Copilot suggestion (gray text)
3. Press Ctrl+i to accept
4. Or press <leader>aa to ask Avante for help
5. Review and edit
```

### Refactoring
```
1. Select code with vaf (select function)
2. Press <leader>aa (open AI chat)
3. Ask: "Refactor this to be more efficient"
4. Review diff and accept changes
```

### Git Workflow
```
1. Make code changes
2. Press ]h to jump to next change
3. Press <leader>hp to preview change
4. Press <leader>hs to stage if good
5. Repeat for all changes
6. Commit in terminal
```

### Code Exploration
```
1. Press <leader>f to find files
2. Open file
3. Press <leader>g to search for function usage
4. Press ]d to go to definition
5. Press <leader>k to jump back
6. Press <leader>h to see documentation
```

### Vue.js Development
```
1. Open .vue file
2. Type <template> - autocomplete kicks in
3. Type component name - ts_ls suggests imports
4. Press ]d to jump to component definition
5. Press <leader>o to format (prettier)
```

### Go Development
```
1. Open .go file
2. Type func name - gopls suggests signature
3. Press Ctrl+i to accept Copilot suggestion
4. Press <leader>c for code actions (imports auto-added by gopls)
5. Errors appear with ]] to navigate
6. Auto-formatted on save (gopls with gofumpt)
```

---

## 📚 Learning Resources

- `:help` - Built-in help
- `:help lsp` - LSP documentation
- `:help treesitter` - Treesitter help
- `:Tutor` - Vim tutorial
- `:checkhealth` - Health check

---

**Remember**: You don't need to memorize everything. Use which-key (`<leader>` + wait) to discover keybindings as you work!

Print this and keep it handy while learning. After a week, most keybindings will become muscle memory. 💪
