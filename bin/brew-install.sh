#!/bin/bash

echo "brew installを開始します。"

brew install macvim --with-override-system-vim

brew install \
ack \
colordiff \
ffmpeg \
fzf \
gibo \
go \
nodebrew \
thefuck \
tidy-html5 \
tig \
tmux \
translate-shell \
youtube-dl \
;

echo "brew installを終了します。"
