autoload -U compinit
compinit

autoload -U colors
colors

# vcs_infoを読み込む
autoload -Uz vcs_info

# vcs_infoの設定
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr " %F{green}[C]%f"
zstyle ':vcs_info:git:*' unstagedstr " %F{red}[U]%f"
zstyle ':vcs_info:*' formats " [%s] %b%c%u"
zstyle ':vcs_info:*' actionformats  " [%s] %b%c%u %F{red}[%a]%f"

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドが存在せず、ディレクトリ名に一致するならcd
setopt auto_cd

# コマンドラインでも`#`で始まるコメントを使用可能にする
setopt interactivecomments

# PROMPT変数内で変数展開をする
setopt prompt_subst

# プロンプト
PROMPT='
%F{yellow}%d%f${vcs_info_msg_0_}
%# '
RPROMPT='as %F{green}%n@%m%f'

# 複数端末間で履歴を共有する
setopt share_history

# 同じコマンド続けて履歴に加えない
setopt hist_ignore_dups

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# https://github.com/rupa/z
: "Z" && {
  _Z_CMD=j
  source ~/assets/z/z.sh
}

# https://github.com/nvbn/thefuck
: "The Fuck" && {
  eval "$(thefuck --alias shit)"
}

: "キーバインディング" && {
  bindkey -v
  bindkey '^R' history-incremental-pattern-search-backward
}

: "エイリアス" && {
  alias sudo='sudo '
  alias q='my-q'
  alias f='ack -g'
  alias ls='ls -F -G' # `-F`は記号を付けるオプション、`-G`は色分けするオプション
  alias ll='ls -a -l -F -G' # `-F`は記号を付けるオプション、`-G`は色分けするオプション
  alias his='history -i' # `-i`は実行日時を表示するオプション
  alias hisall='history -i 1' # `-i`は実行日時を表示するオプション
  alias vimr='vim -R' # `-R`はread-onlyモードで開くオプション
  alias ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
  alias ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'

  case ${OSTYPE} in
    darwin*) # for OS X
      alias coda='open -b com.panic.Coda2'
      alias photoshop='open -b com.adobe.Photoshop'
    ;;
  esac
}

: "拡張子とコマンドを結びつける" && {
  alias -s txt='cat'
  alias -s js='node'
  alias -s rb='ruby'
  alias -s py='python'
}

: "関数" && {
  http() {
    if [ $1 ]; then
      browser-sync start --server --directory --port $1
    else
      browser-sync start --server --directory
    fi
  }

  ghq-f() {
    local dir
    dir=$(ghq list | fzf --reverse) && cd $(ghq root)/$dir
  }
}

: "フック関数" && {
  # "Executed whenever the current working directory is changed."
  # -- http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  chpwd() {
    ls
  }

  # "Executed before each prompt. ..."
  # -- http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  precmd() {
    vcs_info
  }
}

: "環境変数" && {
  export GOPATH=~/Go
  export PATH=$GOPATH/bin:$PATH
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export PATH=~/assets/bin:$PATH
  export PATH=~/bin:$PATH
}
