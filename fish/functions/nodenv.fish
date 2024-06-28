function nodenv
  functions --erase nodenv
  nodenv init - fish | source
  nodenv $argv
end
function node
  functions --erase node
  nodenv init - fish | source
  node $argv
end
function npm
  functions --erase npm
  nodenv init - fish | source
  npm $argv
end
