function cd
  builtin cd $argv; and ls; and echo (pwd) >> ~/.cd_history
end
