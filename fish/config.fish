if status is-interactive
    # Commands to run in interactive sessions can go here
    alias nv nvim
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/go/bin
    set -Ux EDITOR /usr/local/bin/nvim
    set -Ux LESSCHARSET utf-8
end
