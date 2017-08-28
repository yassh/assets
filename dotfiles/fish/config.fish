# https://fishshell.com/docs/current/

set __fish_git_prompt_show_informative_status yes
set __fish_git_prompt_showcolorhints yes

set ___fish_git_prompt_char_dirtystate 'U'
set ___fish_git_prompt_char_stagedstate 'C'
set ___fish_git_prompt_char_untrackedfiles 'N'
set ___fish_git_prompt_char_upstream_behind '-'
set ___fish_git_prompt_char_upstream_ahead '+'
set ___fish_git_prompt_char_cleanstate '-'

# {{{ 環境変数
  set -x EDITOR vim
  set -x GOPATH ~/.go
  set -x PATH $GOPATH/bin $PATH
  set -x PATH ~/.anyenv/bin $PATH
  set -x PATH ~/assets/shellscripts $PATH
  set -x PATH ~/assets/nodescripts $PATH
  set -x PATH ~/bin $PATH

  if test (uname) = "Darwin"
    set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
    set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH
  end
# }}} 環境変数

# {{{ エイリアス
  alias ls='ls -F --color' # `-F`は記号を付けるオプション
  alias ll='ls -a -l --time-style=long-iso'

  alias @="tig status"
  alias @@="tig log"
  alias v='vim -R'
  alias e='micro'
  alias r='ranger'
  alias q='q.js'

  alias :copy='copy.sh'
  alias :fzf='fzf.sh'
  alias :ghq='ghq.sh'
  alias :npm='npm.sh'
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

  alias :gs='git status'
  alias :gl='git log'
  alias :gf='git fetch'
  alias :gp='git pull'
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

  alias win7='VBoxManage startvm "IE11 - Win7"'
  alias win10='VBoxManage startvm "MSEdge - Win10"'

  if test (uname) = 'Darwin'
    alias rm='rmtrash'
    alias photoshop='open -b com.adobe.Photoshop'

     # 'open -b' だとコマンドラインオプションが使えないため、パスで指定
    alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
  end
# }}} エイリアス

# {{{ 関数
  function :cd
    find . -type d -maxdepth 1 | :fzf $argv | read --local result; and cd $result
  end

  function :g
    :ghq $argv | read --local result; and cd $result
  end

  function :e
    cat ~/.cmd_history | tac | :fzf $argv | read --local result; and commandline $result
  end

  function :d
    cat ~/.cd_history | tac | :fzf $argv | read --local result; and cd $result
  end

  function :fav
    cat ~/.fav_* | tac | :fzf $argv | read --local result; and commandline $result
  end
# }}} 関数

# {{{ イベントハンドラ
  # 実行されたコマンドを~/.cmd_historyに記録する
  function on_fish_postexec --on-event fish_postexec
    # 空なら記録しない
    if test -z $argv
      return
    end

    # 2行以上なら記録しない
    if test (echo $argv | wc -l) -ge 2
      return
    end

    echo $argv >> ~/.cmd_history
  end
# }}} イベントハンドラ
