function pyenv
  functions --erase pyenv
  pyenv init - fish | source
  pyenv $argv
end
function python
  functions --erase python
  pyenv init - fish | source
  python $argv
end
function pip
  functions --erase pip
  pyenv init - fish | source
  pip $argv
end

