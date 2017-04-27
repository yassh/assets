function :g
  # https://github.com/junegunn/fzf#fish-shell
  ghq list ^ /dev/null | :fzf $argv | read -l result; and cd (ghq root)/$result
end
