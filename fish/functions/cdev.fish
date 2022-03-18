function cdev --wraps='cd "$(find  -maxdepth 3 -type d | fzf)"' --description 'alias cdev=cd "$(find  -maxdepth 3 -type d | fzf)"'
  cd "$(find  -maxdepth 3 -type d | fzf)" $argv; 
end
