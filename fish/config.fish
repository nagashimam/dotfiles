if status is-interactive
    # Commands to run in interactive sessions can go here
    status --is-interactive; and nodenv init - fish | source
    eval (zellij setup --generate-auto-start fish | string collect)
end
