#!/bin/bash

echo "brew installを開始します。"

brew upgrade macvim --with-override-system-vim

brew upgrade \
colordiff \
coreutils \
ffmpeg \
fzf \
gibo \
go \
hub \
jo \
the_silver_searcher \
thefuck \
tidy-html5 \
tig \
translate-shell \
webkit2png \
youtube-dl \
;

echo "brew installを終了します。"
