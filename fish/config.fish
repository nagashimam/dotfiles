if status is-interactive
    # Commands to run in interactive sessions can go here
    alias nv nvim
    . ~/.config/env.sh
    set -gx OLLAMA_API_BASE http://localhost:11434
end
