autoload -U compinit
compinit

autoload -U colors
colors

autoload -Uz add-zsh-hook

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# コマンドが存在せず、ディレクトリ名に一致するならcd
setopt auto_cd

# -[タブキー]でこれまでに移動したディレクトリが一覧表示されるようにする
setopt auto_pushd

# コマンドラインでも`#`で始まるコメントを使用可能にする
setopt interactivecomments

# {{{ 環境変数
  export EDITOR=vim
  export GOPATH=$HOME/.go
  export PATH=$GOPATH/bin:$PATH
  export PATH=$HOME/.anyenv/bin:$PATH
  export PATH=$HOME/assets/bin:$PATH
  export PATH=$HOME/bin:$PATH
# }}} 環境変数

# {{{ キーバインディング
  #bindkey -v # vi mode
  #bindkey '^R' history-incremental-pattern-search-backward
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
  alias :tac='tail -r' # 入力したすべての行を逆順に表示する。
  alias :t='tldr'
  alias :vv='vim -R' # `-R`はread-onlyモードで開くオプション

  alias :q='my-q'

  alias :ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
  alias :ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'

  alias :gl='git log --graph --decorate --date=iso'
  alias :gf='git fetch'
  alias :gs='git status'
  alias :gd='git diff'
  alias :gdn='git diff --name-only'
  alias :gdc='git diff --cached'
  alias :gdcn='git diff --cached --name-only'
  alias :gdt='git difftool --dir-diff --no-symlink'
  alias :gc='git commit -v'

  alias :n='npm run'

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

  case ${OSTYPE} in
    darwin*) # for OS X
      alias coda='open -b com.panic.Coda2'
      alias libre='open -b org.libreoffice.script'
      alias photoshop='open -b com.adobe.Photoshop'
      alias term='open -b com.googlecode.iterm2'
    ;;
  esac
# }}} エイリアス

# {{{ 拡張子とコマンドを結びつける
  #alias -s {css,html,js,json,md,py,rb,scss,txt}=$EDITOR # 実行可能なファイルもエディタで開いてしまう問題がある。
# }}} 拡張子とコマンドを結びつける

# {{{ 関数
  :copy() {
    if [ $# -eq 0 ]; then
      gocopy
    else
      echo -n "$@" | gocopy && echo "Copied: $@"
    fi
  }

  :serve() {
    if [ $1 ]; then
      http-server -o -p $1
    else
      http-server -o
    fi
  }

  :fzf() {
    fzf -q "$1" --reverse
  }

  :ff() {
    local result
    result=$(ag --hidden -g '' | :fzf "$1") && :copy "$(realpath $result)"
  }

  # https://github.com/junegunn/fzf/wiki/examples#git
  :gco() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
             fzf -q "$1" --reverse -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }

  :ios() {
    local device
    device=$(xcrun instruments -s | grep "\(Simulator\)" | :fzf "$1") && xcrun instruments -w $device
  }

  :nr() {
    local script
    script=$(npm run | grep "^  \S" | sed -e "s/^  //g" | :fzf "$1") && npm run $script
  }

  :cd() {
    local result
    result=$(find . -type d -maxdepth 1 | :fzf "$1") && cd $result
  }

  :g() {
    local result
    result=$(ghq list 2> /dev/null | :fzf "$1") && cd $(ghq root)/$result
  }

  :c() {
    local result
    result=$(cat ~/.cmd_history | :tac | :fzf "$1") && print -z $result
  }

  :d() {
    local result
    result=$(cat ~/.cd_history | :tac | :fzf "$1") && cd $result
  }

  :cmd() {
    local result
    result=$(cat ~/*.favcmd | :fzf "$1") && print -z $result
  }

  :dir() {
    local result
    result=$(cat ~/*.favdir | :fzf "$1") && cd $result
  }

  :url() {
    local result
    result=$(cat ~/*.favurl | :fzf "$1") && open-url $result
  }

  :phrase() {
    local result
    result=$(cat ~/*.favphrase | :fzf "$1") && :copy $result
  }
# }}} 関数

# {{{ フック
  # chpwd
  # "Executed whenever the current working directory is changed."
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  chpwd() {
    ls
    echo "$(realpath .)" >> ~/.cd_history
  }

  # zshaddhistory
  # "Executed when a history line has been read interactively, but before it is executed."
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  zshaddhistory() {
    echo $(echo $1) >> ~/.cmd_history # 改行を潰して保存する
  }
# }}} フック

# The Fuck
# https://github.com/nvbn/thefuck
eval "$(thefuck --alias shit)"

# anyenv
# https://github.com/riywo/anyenv
eval "$(anyenv init -)"

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
