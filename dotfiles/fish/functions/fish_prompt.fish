function fish_prompt
  echo

  if [ (git rev-parse --is-inside-work-tree ^ /dev/null) ]
    echo (set_color yellow)(pwd)(set_color normal) (git rev-parse --abbrev-ref HEAD)
  else
    echo (set_color yellow)(pwd)(set_color normal)
  end

  echo (date +'%Y-%m-%d %H:%M') ': '
end
