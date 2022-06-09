function cdev --wraps='cd "$(find  -maxdepth 3 -type d | fzf)"' --description 'alias cdev=cd "$(find  -maxdepth 3 -type d | fzf)"'
  set --local cd_path (find $CDEV_PATH -maxdepth 3 -type d | fzf);
  cd $cd_path;
end
