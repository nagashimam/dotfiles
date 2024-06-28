if status is-interactive
    functions -q nodenv; and functions -e nodenv; 
    source ~/.config/fish/functions/nodenv.fish
    source ~/.config/fish/functions/pyenv.fish
end
