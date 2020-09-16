#!/bin/bash

echo "dotfilesのセットアップを開始します。"

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
__DIR__="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DOT_FILES=(
  .agignore
  .gitconfig
  .gitignore_global
  .hyper.js
  .mpv
  .zshrc
  emmet
)

for file in ${DOT_FILES[@]}
do
  if [ -L ~/$file ]; then
    continue
  fi

  if [ -e ~/$file ]; then
    mv ~/$file ~/$file.backup
    if [ $? = 0 ]; then
      echo "~/$file を ~/$file.backup にリネームしました。"
    else
      echo "~/$file を ~/$file.backup にリネームできませんでした。"
    fi
  fi

  ln -s $__DIR__/$file ~/$file
  if [ $? = 0 ]; then
    echo "~/$file に $__DIR__/$file へのシンボリックリンクを作成しました。"
  else
    echo "~/$file に $__DIR__/$file へのシンボリックリンクを作成できませんでした。"
  fi
done

echo "dotfilesのセットアップを終了します。"

# メモ
# -e fileは、fileがシンボリックリンクとして存在した場合はその参照先のファイルが存在するかどうかをチェックするようだ。
# fileがシンボリックリンクかファイルとして存在するかどうかをチェックするには、-L file -o -e fileとすべきであるようだ。
