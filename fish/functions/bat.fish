# required by fzf.fish
function bat --wraps=badcat --wraps=batcat --description 'alias bat=batcat'
  batcat $argv; 
end
