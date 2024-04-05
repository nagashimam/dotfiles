function nv --wraps=HOME_PC=\'TRUE\'\ nvim --description alias\ nv=HOME_PC=\'TRUE\'\ nvim
  HOME_PC='TRUE' nvim $argv; 
end
