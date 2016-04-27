autoload -U compinit
compinit

autoload -U colors
colors

autoload -Uz add-zsh-hook

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドが存在せず、ディレクトリ名に一致するならcd
setopt auto_cd

# コマンドラインでも`#`で始まるコメントを使用可能にする
setopt interactivecomments

# 複数端末間で履歴を共有する
setopt share_history

# 同じコマンド続けて履歴に加えない
setopt hist_ignore_dups

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# {{{ キーバインディング
  bindkey -v
  bindkey '^R' history-incremental-pattern-search-backward
# }}} キーバインディング

# {{{ プロンプト
  # vcs_infoを読み込む
  autoload -Uz vcs_info

  +vi-git-info() {
    hook_com[misc]+=" | $(git rev-list --count @{u}..HEAD 2> /dev/null)-$(git rev-list --count HEAD..@{u} 2> /dev/null) | $(git config user.name) <$(git config user.email)>"
  }

  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' unstagedstr " | %F{red}U%f"
  zstyle ':vcs_info:git:*' stagedstr " | %F{green}C%f"
  zstyle ':vcs_info:git+set-message:*' hooks git-info
  zstyle ':vcs_info:git:*' formats " | %b%u%c%m"
  zstyle ':vcs_info:git:*' actionformats  " | %b | %F{red}%a%f%u%c%m"

  _vcs_precmd() {
    vcs_info
  }

  # precmdフックで_vcs_precmd関数を実行する
  #
  # add-zsh-hook
  # http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Manipulating-Hook-Functions
  # precmd
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  add-zsh-hook precmd _vcs_precmd

  # PROMPT変数内で変数展開をする
  setopt prompt_subst

  PROMPT='
%F{yellow}%d%f${vcs_info_msg_0_}
%# '
  RPROMPT='as %F{green}%n@%m%f'
# }}} プロンプト

# {{{ エイリアス
  alias sudo='sudo '
  alias ls='ls -F -G' # `-F`は記号を付けるオプション、`-G`は色分けするオプション
  alias ll='ls -a -l -F -G' # `-F`は記号を付けるオプション、`-G`は色分けするオプション
  alias his='history -i' # `-i`は実行日時を表示するオプション
  alias hisall='history -i 1' # `-i`は実行日時を表示するオプション
  alias vimr='vim -R' # `-R`はread-onlyモードで開くオプション
  alias ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
  alias ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
  alias gl='git log --graph --decorate --date=iso'
  alias gf='git fetch'
  alias gs='git status'
  alias gd='git diff'
  alias gdn='git diff --name-only'
  alias gdc='git diff --cached'
  alias gdcn='git diff --cached --name-only'
  alias gdt='git difftool --dir-diff --no-symlink'
  alias gc='git commit -v'
  alias gcae='git commit --allow-empty'
  alias t2='tree -L 2'
  alias h='tldr'
  alias :en='trans :en'
  alias :ja='trans :ja'
  alias :ru='trans :ru'
  alias :vi='trans :vi'
  alias en:ja='trans en:ja'
  alias en:ru='trans en:ru'
  alias en:vi='trans en:vi'
  alias ja:en='trans ja:en'
  alias ja:ru='trans ja:ru'
  alias ja:vi='trans ja:vi'
  alias ru:en='trans ru:en'
  alias ru:ja='trans ru:ja'
  alias vi:en='trans vi:en'
  alias vi:ja='trans vi:ja'
  alias q='my-q'
  alias gol='my-gol'
  alias sn="vim -c 'Simplenote -l'"
  alias ie11='VBoxManage startvm "IE11 - Win7"'

  case ${OSTYPE} in
    darwin*) # for OS X
      alias coda='open -b com.panic.Coda2'
      alias photoshop='open -b com.adobe.Photoshop'
    ;;
  esac
# }}} エイリアス

# {{{ 拡張子とコマンドを結びつける
  alias -s txt='cat'
  alias -s js='node'
  alias -s rb='ruby'
  alias -s py='python'
# }}} 拡張子とコマンドを結びつける

# {{{ 環境変数
  export EDITOR=vim
  export GOPATH=~/Go
  export PATH=$GOPATH/bin:$PATH
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export PATH=~/assets/bin:$PATH
  export PATH=~/bin:$PATH
# }}} 環境変数

# {{{ 関数
  serve() {
    if [ $1 ]; then
      browser-sync start --server --directory --port $1
    else
      browser-sync start --server --directory
    fi
  }

  ff() {
    local result

    if [ $1 ]; then
      result=$(ack -g $1 | fzf --reverse)
    else
      result=$(fzf --reverse)
    fi

    if [ -z "$result" ]; then
      return 0
    fi

    printf $result | pbcopy # XXX
    echo $result
  }

  g() {
    local dir
    dir=$(ghq list | fzf --reverse) && cd $(ghq root)/$dir
  }
# }}} 関数

# {{{ フック
  # chpwd
  # "Executed whenever the current working directory is changed."
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  chpwd() {
    ls
  }
# }}} フック

# Z
# https://github.com/rupa/z
_Z_CMD=j
source ~/assets/z/z.sh

# The Fuck
# https://github.com/nvbn/thefuck
eval "$(thefuck --alias shit)"

# rbenv
# https://github.com/rbenv/rbenv
eval "$(rbenv init -)"
