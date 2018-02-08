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
  export GOPATH=~/.go
  export PATH=$GOPATH/bin:$PATH
  export PATH=~/.anyenv/bin:$PATH
  export PATH=~/assets/bin:$PATH
  export PATH=~/assets/shellscripts:$PATH
  export PATH=~/assets/pyscripts:$PATH
  export PATH=~/assets/nodescripts:$PATH
  export PATH=~/bin:$PATH
  export FZF_DEFAULT_OPTS='--reverse --inline-info'
  export CD_HISTORY_FILE=~/.cd_history
  export CMD_HISTORY_FILE=~/.cmd_history

  if test $(uname) = 'Darwin'; then
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
  fi
# }}} 環境変数

# {{{ エイリアス
  alias sudo='sudo '

  alias ls='ls -F --color' # `-F`は記号を付けるオプション
  alias ll='ls -a -l --time-style=long-iso'

  alias r='ranger'
  alias m='micro'
  alias e='vim'
  alias e:r='vim -R'
  alias v='gvim'
  alias v:r='gvim -R'
  alias s='ag -Q' # 文字列で全文検索
  alias f='ag -g' # 正規表現でファイル名検索 ※-Qと-gを組み合わせられない。Issue: https://github.com/ggreer/the_silver_searcher/issues/1006

  alias tree='tree -N' # 日本語が文字化けしないように`-N`オプションを付ける
  alias t:1='tree -L 1'
  alias t:2='tree -L 2'
  alias t:3='tree -L 3'

  alias :q='q.js'
  alias :copy='copy.sh'
  alias :serve='serve.sh'

  alias :ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
  alias :ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'

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

  if test $(uname) = 'Darwin'; then
    alias o='open'
    alias photoshop='open -b com.adobe.Photoshop'
    alias marp='open -b jp.yhatt.marp'

     # 'open -b' だとコマンドラインオプションが使えないため、パスで指定
    alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary'
  fi
# }}} エイリアス

# {{{ Git
  alias g:f='git fetch'
  alias g:s='git status'
  alias g:d='git diff'
  alias g:d:c='git diff --cached'
  alias g:dt='git difftool --dir-diff --no-symlink'
  alias g:a='git add'
  alias g:c='git commit -v'
  alias g:unstage='git reset -q @ --' # アンステージ
  alias g:discard='git checkout --'

  # https://github.com/junegunn/fzf/wiki/examples#git
  g:co() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" |
             fzf -q "$1" --reverse -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }
# }}} 関数

# {{{ 関数
  :ios() {
    local device
    device=$(xcrun instruments -s | grep "\(Simulator\)" | fzf -q "$1") && xcrun instruments -w $device
  }

  :cd() {
    local result
    result=$(find . -type d -maxdepth 1 | fzf -q "$1") && cd $result
  }

  :g() {
    local result
    result=$(ghq list | fzf -q "$1") && cd $(ghq root)/$result
  }

  :d() {
    local result
    result=$(cat $CD_HISTORY_FILE | tac | fzf -q "$1") && cd $result
  }

  :e() {
    local result
    result=$(cat $CMD_HISTORY_FILE | tac | fzf -q "$1") && print -z $result
  }

  :c() {
    local result
    result=$(cat ~/.fav_* | fzf -q "$1") && print -z $result
  }

  :tmpl() {
    local result
    result=$(find ~/assets/tmpl -type f | fzf -q "$1") && cat $result
  }
# }}} 関数

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
  zstyle ':vcs_info:git:*' formats " %b%u%c%m"
  zstyle ':vcs_info:git:*' actionformats  " %b | %F{red}%a%f%u%c%m"

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
%D{%Y-%m-%d %H:%M}> '
  RPROMPT='as %F{green}%n@%m%f'
# }}} プロンプト

# {{{ フック
  # chpwd
  # "Executed whenever the current working directory is changed."
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  chpwd() {
    ls

    touch $CD_HISTORY_FILE
    local cwd=$(pwd)
    awk -v cwd="$cwd" -i inplace '$0 != cwd { print $0 }' $CD_HISTORY_FILE # cwdに一致する行を取り除く
    pwd >> $CD_HISTORY_FILE
  }

  # zshaddhistory
  # "Executed when a history line has been read interactively, but before it is executed."
  # http://zsh.sourceforge.net/Doc/Release/Functions.html#Hook-Functions
  zshaddhistory() {
    touch $CMD_HISTORY_FILE
    local cmd=$(echo $1) # 改行を潰す
    awk -v cmd="$cmd" -i inplace '$0 != cmd { print $0 }' $CMD_HISTORY_FILE # cmdに一致する行を取り除く
    echo "$cmd" >> $CMD_HISTORY_FILE
  }
# }}} フック

# anyenv
# https://github.com/riywo/anyenv
eval "$(anyenv init - --no-rehash)" # `--no-rehash`を付けるとzshの起動が速くなる

# The Fuck
# https://github.com/nvbn/thefuck
eval "$(thefuck --alias shit)"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
