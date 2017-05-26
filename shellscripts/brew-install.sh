#!/bin/bash

echo "brew installを開始します。"

brew update

brew install ffmpeg \
--with-chromaprint \
--with-fdk-aac \
--with-fontconfig \
--with-freetype \
--with-frei0r \
--with-game-music-emu \
--with-libass \
--with-libbluray \
--with-libbs2b \
--with-libcaca \
--with-libgsm \
--with-libmodplug \
--with-libsoxr \
--with-libssh \
--with-libvidstab \
--with-libvorbis \
--with-libvpx \
--with-opencore-amr \
--with-openh264 \
--with-openjpeg \
--with-openssl \
--with-opus \
--with-rtmpdump \
--with-rubberband \
--with-schroedinger \
--with-sdl2 \
--with-snappy \
--with-speex \
--with-tesseract \
--with-theora \
--with-tools \
--with-two-lame \
--with-wavpack \
--with-webp \
--with-x265 \
--with-xz \
--with-zeromq \
--with-zimg \
--without-lame \
--without-qtkit \
--without-securetransport \
--without-x264 \
--without-xvid \
;

brew install macvim --with-override-system-vim
brew linkapps macvim
brew install emacs --with-cocoa
brew linkapps emacs
brew install mpv --with-bundle
brew linkapps mpv

brew install \
colordiff \
coreutils \
fish \
fzf \
gibo \
go \
hub \
jo \
micro \
ranger \
rmtrash \
the_silver_searcher \
thefuck \
tidy-html5 \
tig \
translate-shell \
webkit2png \
youtube-dl \
;

# https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
brew tap caskroom/cask
brew tap caskroom/versions
brew cask install airmail-beta
brew cask install firefox --language=ja
brew cask install fork
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install iterm2-beta
brew cask install simplenote
brew cask install sublime-text
brew cask install ubar
brew cask install visual-studio-code

echo "brew installを終了します。"
