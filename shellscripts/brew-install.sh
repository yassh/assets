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
;

brew install coreutils
brew install fish
brew install fzf
brew install go
brew install hub
brew install micro
brew install ranger
brew install rmtrash
brew install the_silver_searcher
brew install thefuck
brew install tig
brew install translate-shell
brew install vim
brew install webkit2png
brew install youtube-dl

# https://github.com/caskroom/homebrew-cask/blob/master/USAGE.md
brew tap caskroom/cask
brew tap caskroom/versions
brew cask install airmail-beta
brew cask install alfred
brew cask install appcleaner
brew cask install beyond-compare
brew cask install caffeine
brew cask install ccleaner
brew cask install charles
brew cask install chatwork
brew cask install cheatsheet
brew cask install dictionaries
brew cask install emacs
brew cask install firefox --language=ja
brew cask install fork
brew cask install franz
brew cask install google-chrome
brew cask install google-chrome-canary
brew cask install iterm2-beta
brew cask install macvim
brew cask install mpv
brew cask install simplenote
brew cask install sublime-text
brew cask install table-tool
brew cask install veracrypt
brew cask install virtualbox
brew cask install visual-studio-code

echo "brew installを終了します。"
