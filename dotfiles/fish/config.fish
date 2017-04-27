# https://fishshell.com/docs/current/

set __fish_git_prompt_show_informative_status yes
set __fish_git_prompt_showcolorhints yes

set ___fish_git_prompt_char_dirtystate 'U'
set ___fish_git_prompt_char_stagedstate 'C'
set ___fish_git_prompt_char_untrackedfiles 'N'
set ___fish_git_prompt_char_upstream_behind '-'
set ___fish_git_prompt_char_upstream_ahead '+'
set ___fish_git_prompt_char_cleanstate '-'

set PATH $HOME/.anyenv/bin $PATH
set PATH $HOME/assets/bin $PATH
set PATH $HOME/assets/nodescripts $PATH

alias ll='ls -a -l --time-style=long-iso'

alias :copy='copy.sh'
alias :fzf='fzf.sh'
alias :ghq='ghq.sh'
alias :serve='serve.sh'
alias :q='q.js'

alias :gitignore='cat ~/assets/configfiles/gitignore' # FIXME: ~/assets/configfiles/gitignoreを相対パスで記述できないか？
alias :editorconfig='cat ~/assets/configfiles/editorconfig' # FIXME: ~/assets/configfiles/editorconfigを相対パスで記述できないか？
alias :eslintrc='cat ~/assets/configfiles/eslintrc.yml' # FIXME: ~/assets/configfiles/editorconfigを相対パスで記述できないか？
alias :.gitignore=':gitignore > .gitignore'
alias :.editorconfig=':editorconfig > .editorconfig'
alias :.eslintrc=':eslintrc > .eslintrc.yml'

alias :ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
alias :ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'

alias @='git log -p --graph --decorate --date=iso'
alias :gf='git fetch'
alias :gs='git status'
alias :gd='git diff'
alias :gdn='git diff --name-only'
alias :gdc='git diff --cached'
alias :gdcn='git diff --cached --name-only'
alias :gdt='git difftool --dir-diff --no-symlink'
alias :gc='git commit -v'

alias :en='trans :en'
alias :ja='trans :ja'
alias :ru='trans :ru'
alias en:ja='trans en:ja'
alias en:ru='trans en:ru'
alias ja:en='trans ja:en'
alias ja:ru='trans ja:ru'
alias ru:en='trans ru:en'
alias ru:ja='trans ru:ja'

alias ie9='VBoxManage startvm "IE9 - Win7"'
alias ie10='VBoxManage startvm "IE10 - Win7"'
alias ie11='VBoxManage startvm "IE11 - Win7"'

function :g
  :ghq $argv | read --local result; and cd $result
end
