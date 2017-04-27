function fish_prompt
  echo

  if [ (git rev-parse --is-inside-work-tree ^ /dev/null) ]
    echo (set_color yellow)(pwd)(set_color normal)(__fish_git_prompt) (git config user.name) '<'(git config user.email)'>'
  else
    echo (set_color yellow)(pwd)(set_color normal)
  end

  echo (date +'%Y-%m-%d %H:%M')'> '
end
