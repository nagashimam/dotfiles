if status is-interactive
    # Commands to run in interactive sessions can go here
    alias nv nvim
    fish_add_path $HOME/.local/bin
    set -Ux LESSCHARSET utf-8
end
