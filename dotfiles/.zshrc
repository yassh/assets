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

# プロンプトを表示する直前にvcs_infoを呼び出す
precmd() {
  vcs_info
}

# PROMPT変数内で変数展開をする
setopt prompt_subst

# プロンプト
PROMPT='
%F{yellow}%d%f${vcs_info_msg_0_}
%# '
RPROMPT='as %F{green}%n@%m%f'

# 履歴
setopt share_history # 複数端末間で履歴を共有する
setopt hist_ignore_dups # 同じコマンド続けて履歴に加えない
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# コマンドが存在せず、ディレクトリ名に一致するならcd
setopt auto_cd

# 補完で大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# エイリアス
alias sudo='sudo '
alias ls='ls -G' # `-G`は色分けするオプション
alias ll='ls -a -l -F -G' # `-F`は記号を付けるオプション、`-G`は色分けするオプション
alias his='history -i' # `-i`は実行日時を表示するオプション
alias ydl='youtube-dl -f bestvideo+bestaudio/best -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'
alias ydla='youtube-dl -f bestaudio -o "%(upload_date)s %(title)s [%(extractor)s %(id)s].%(ext)s" --no-mtime'

# 拡張子とコマンドを結びつける
alias -s txt='cat'
alias -s js='node'
alias -s rb='ruby'
alias -s py='python'

# cd後に自動的にlsさせる
chpwd() {
  \ls -F -G
}

# Z
_Z_CMD=j
source ~/assets/z/z.sh

# 環境変数
export GOPATH=~/Go
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=~/assets/bin:$PATH
export PATH=~/bin:$PATH
