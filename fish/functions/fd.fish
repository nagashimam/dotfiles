# required by fzf.fish
function fd --wraps=fdfind --description 'alias fd=fdfind'
  fdfind $argv; 
end
