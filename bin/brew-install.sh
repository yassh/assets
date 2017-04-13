#!/bin/bash

echo "brew installを開始します。"

brew install ffmpeg --with-fdk-aac --with-ffplay --with-freetype --with-libass --with-libquvi --with-libvorbis --with-libvpx --with-opus --with-x265
brew install macvim --with-override-system-vim
brew install mpv --with-bundle
brew linkapps mpv

brew install \
colordiff \
coreutils \
fzf \
gibo \
go \
hub \
jo \
micro \
rmtrash \
the_silver_searcher \
thefuck \
tidy-html5 \
tig \
translate-shell \
webkit2png \
youtube-dl \
;

echo "brew installを終了します。"
