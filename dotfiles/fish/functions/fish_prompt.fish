function fish_prompt
  echo

  if [ (git rev-parse --is-inside-work-tree ^ /dev/null) ]
    echo\
      (set_color yellow)(pwd)(set_color normal)\
      (git rev-parse --abbrev-ref HEAD)\
      "|"\
      (git rev-list --count @\{u\}..HEAD ^ /dev/null)"-"(git rev-list --count HEAD..@\{u\} ^ /dev/null)\
      "|"\
      (git config user.name) "<"(git config user.email)">"\
    ;
  else
    echo (set_color yellow)(pwd)(set_color normal)
  end

  echo (date +'%Y-%m-%d %H:%M')"> "
end
