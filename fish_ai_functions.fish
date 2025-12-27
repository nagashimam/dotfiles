# AI Assistant Functions for Fish Shell
# Add these to your ~/.config/fish/config.fish or source this file
# Source with: source ~/.config/fish_ai_functions.fish

# ============================================
# Gemini CLI Functions
# ============================================

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
    gemini-cli "Go programming best practices: $argv"
end

# Explain error messages
function gerr
    gemini-cli "Explain this error and provide a fix: $argv"
end

# Quick code explanation
function gexplain
    gemini-cli "Explain this code: $argv"
end

# API documentation lookup
function gapi
    gemini-cli "Show documentation and examples for: $argv"
end

# ============================================
# Claude Code CLI Functions
# ============================================

# Quick Claude Code access (if you prefer shorter command)
function cc
    claude-code $argv
end

# Review current changes
function ccreview
    claude-code "Review the current git changes and suggest improvements"
end

# Generate commit message
function cccommit
    set -l changes (git diff --staged)
    if test -z "$changes"
        echo "No staged changes. Use 'git add' first."
        return 1
    end
    claude-code "Generate a clear, concise commit message for these changes"
end

# Refactor file
function ccrefactor
    if test (count $argv) -eq 0
        echo "Usage: ccrefactor <filename>"
        return 1
    end
    claude-code "Refactor $argv to improve code quality, readability, and performance"
end

# Add tests
function cctest
    if test (count $argv) -eq 0
        echo "Usage: cctest <filename>"
        return 1
    end
    claude-code "Add comprehensive unit tests for $argv"
end

# ============================================
# Git + AI Integration
# ============================================

# Git commit with AI-generated message
function gaic
    # Stage all changes if nothing is staged
    set -l staged (git diff --cached --name-only)
    if test -z "$staged"
        git add -A
    end

    # Get AI-generated commit message
    set -l msg (claude-code "Generate a commit message for these changes (one line only)" 2>/dev/null)

    # Show message and ask for confirmation
    echo "Suggested commit message:"
    echo "  $msg"
    echo ""
    read -P "Use this message? [Y/n] " -l confirm

    if test "$confirm" = "n" -o "$confirm" = "N"
        echo "Commit cancelled."
        return 1
    end

    git commit -m "$msg"
end

# ============================================
# Neovim Integration
# ============================================

# Open file in Neovim with AI explanation
function nvai
    if test (count $argv) -eq 0
        echo "Usage: nvai <filename>"
        return 1
    end

    # Open file in Neovim
    nvim $argv

    # Note: You can ask Avante to explain inside Neovim with <leader>aa
end

# ============================================
# Project-Specific AI Helpers
# ============================================

# Initialize AI context for current project
function aicontext
    echo "Project: "(basename (pwd))
    echo "Type: "(test -f package.json && echo "Node.js" || test -f go.mod && echo "Go" || echo "Unknown")
    echo ""
    echo "Use 'gvue' for Vue.js help"
    echo "Use 'ggo' for Go help"
    echo "Use 'cc' for Claude Code"
    echo "Use 'gm' for general Gemini help"
end

# ============================================
# Learning Helpers
# ============================================

# Learn Vue.js topic
function learnvue
    if test (count $argv) -eq 0
        echo "Usage: learnvue <topic>"
        echo "Example: learnvue 'computed vs watch'"
        return 1
    end
    gemini-cli "Explain Vue.js 3 Composition API topic with examples: $argv"
end

# Learn Go topic
function learngo
    if test (count $argv) -eq 0
        echo "Usage: learngo <topic>"
        echo "Example: learngo 'goroutines and channels'"
        return 1
    end
    gemini-cli "Explain Go programming concept with examples: $argv"
end

# Compare two approaches
function compare
    if test (count $argv) -lt 2
        echo "Usage: compare <approach1> <approach2>"
        echo "Example: compare 'Vue Options API' 'Vue Composition API'"
        return 1
    end
    gemini-cli "Compare and contrast: $argv[1] vs $argv[2]. Include pros, cons, and when to use each."
end

# ============================================
# Utility Functions
# ============================================

# Check if AI CLI tools are installed
function aicheck
    echo "Checking AI CLI tools..."
    echo ""

    # Claude Code
    if type -q claude-code
        echo "✅ Claude Code CLI: installed"
    else
        echo "❌ Claude Code CLI: not found"
        echo "   Install from: https://code.claude.com"
    end

    # Gemini CLI
    if type -q gemini-cli
        echo "✅ Gemini CLI: installed"
    else
        echo "❌ Gemini CLI: not found"
        echo "   Install with: npm install -g @google/generative-ai-cli"
    end

    # GitHub CLI (for Copilot)
    if type -q gh
        echo "✅ GitHub CLI: installed"
    else
        echo "❌ GitHub CLI: not found"
        echo "   Install from: https://cli.github.com"
    end

    echo ""

    # Check environment variables
    if set -q ANTHROPIC_API_KEY
        echo "✅ ANTHROPIC_API_KEY: set"
    else
        echo "⚠️  ANTHROPIC_API_KEY: not set"
        echo "   Add to ~/.config/env.sh"
    end

    if set -q GEMINI_API_KEY
        echo "✅ GEMINI_API_KEY: set"
    else
        echo "⚠️  GEMINI_API_KEY: not set"
        echo "   Add to ~/.config/env.sh"
    end
end

# Show AI command help
function aihelp
    echo "AI Assistant Commands"
    echo "===================="
    echo ""
    echo "Gemini (Free tier):"
    echo "  gm <query>              - Ask Gemini anything"
    echo "  gvue <topic>            - Vue.js help"
    echo "  ggo <topic>             - Go help"
    echo "  gerr <error>            - Explain error"
    echo "  gexplain <code>         - Explain code"
    echo "  gapi <function>         - API docs"
    echo ""
    echo "Claude Code (Paid):"
    echo "  cc <task>               - Ask Claude Code"
    echo "  ccreview                - Review changes"
    echo "  cccommit                - Generate commit message"
    echo "  ccrefactor <file>       - Refactor file"
    echo "  cctest <file>           - Add tests"
    echo ""
    echo "Git + AI:"
    echo "  gaic                    - Commit with AI message"
    echo ""
    echo "Learning:"
    echo "  learnvue <topic>        - Learn Vue.js"
    echo "  learngo <topic>         - Learn Go"
    echo "  compare <a> <b>         - Compare approaches"
    echo ""
    echo "Utilities:"
    echo "  aicheck                 - Check AI setup"
    echo "  aicontext               - Show project context"
    echo "  aihelp                  - Show this help"
    echo ""
    echo "Neovim AI:"
    echo "  <leader>aa              - Open Avante chat"
    echo "  Alt+l                   - Accept Copilot"
end

# ============================================
# Aliases for Common Workflows
# ============================================

# Quick aliases
alias ai='aihelp'
alias aic='aicheck'

# ============================================
# Installation Note
# ============================================

# Display installation instructions on first load
if not set -q AI_FUNCTIONS_LOADED
    echo "🤖 AI Assistant Functions Loaded!"
    echo ""
    echo "Type 'aihelp' to see all available commands"
    echo "Type 'aicheck' to verify your setup"
    echo ""
    set -U AI_FUNCTIONS_LOADED 1
end
