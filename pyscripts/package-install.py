#!/usr/bin/env python3

from os import system
from shutil import which
from sys import argv

if 'apt' in argv or 'all' in argv:
    if not which('apt-get'):
        print('apt-getコマンドが存在しません。')
    else:
        print('apt-get installを開始します。')
        system('sudo apt-get update')
        system('sudo apt-get install -y ' + ' '.join([
            'silversearcher-ag',
            # 'jq',
            # 'ranger',
            # 'tig',
        ]))
        print('apt-get installを終了します。')

if 'brew' in argv or 'all' in argv:
    if not which('brew'):
        print('brewコマンドが存在しません。')
    else:
        print('brew installを開始します。')
        system('brew update')
        system('brew install ' + ' '.join([
            'coreutils',
            'direnv',
            'go',
            'the_silver_searcher',
            'translate-shell',
            'tree',
            'wget',
            'yarn',
            'youtube-dl',
            # 'hub',
            # 'jq',
            # 'micro',
            # 'pngquant',
            # 'ranger',
            # 'tig',
        ]))
        system('brew install aria2 --with-libssh2')
        system('brew install ffmpeg ' + ' '.join([
            '--with-chromaprint',
            '--with-fdk-aac',
            '--with-fontconfig',
            '--with-freetype',
            '--with-frei0r',
            '--with-game-music-emu',
            '--with-libass',
            '--with-libbluray',
            '--with-libbs2b',
            '--with-libcaca',
            '--with-libgsm',
            '--with-libmodplug',
            '--with-libsoxr',
            '--with-libssh',
            '--with-libvidstab',
            '--with-libvorbis',
            '--with-libvpx',
            '--with-opencore-amr',
            '--with-openh264',
            '--with-openjpeg',
            '--with-openssl',
            '--with-opus',
            '--with-rtmpdump',
            '--with-rubberband',
            '--with-schroedinger',
            '--with-sdl2',
            '--with-snappy',
            '--with-speex',
            '--with-tesseract',
            '--with-theora',
            '--with-tools',
            '--with-two-lame',
            '--with-wavpack',
            '--with-webp',
            '--with-x265',
            '--with-xz',
            '--with-zeromq',
            '--with-zimg',
        ]))
        system('brew install vim ' + ' '.join([
            # '--with-client-server',
            '--with-gettext',
            '--with-lua',
            '--with-luajit',
            '--with-override-system-vi',
            '--with-python3',
            '--with-tcl',
        ]))
        print('brew installを終了します。')

if 'cask' in argv or 'all' in argv:
    if not which('brew'):
        print('brewコマンドが存在しません。')
    else:
        print('brew cask installを開始します。')
        system('brew tap caskroom/cask')
        system('brew tap caskroom/versions')
        system('brew update')
        list = [
            'appcleaner',
            'beyond-compare',
            'ccleaner',
            'firefox --language=ja',
            'fork',
            'google-chrome',
            'google-japanese-ime',
            'hyper',
            'insomnia',
            'macvim',
            'mapture',
            'mpv',
            'notion',
            'slack',
            'sublime-text',
            'table-tool',
            'textexpander',
            'virtualbox',
            'visual-studio-code',
            # 'alfred',
            # 'caffeine',
            # 'charles',
            # 'devdocs',
            # 'dictionaries',
            # 'fuwari',
            # 'imageoptim',
            # 'iterm2-beta',
            # 'itsycal',
            # 'linear',
            # 'macdown',
            # 'marp',
            # 'raindropio',
            # 'station',
            # 'tableplus',
        ]
        for cask in list:
            system('brew cask install ' + cask)
        print('brew cask installを終了します。')

if 'go' in argv or 'all' in argv:
    if not which('go'):
        print('goコマンドが存在しません。')
    else:
        print('go getを開始します。')
        system('go get ' + ' '.join([
            'github.com/atotto/clipboard/cmd/gocopy',
            'github.com/atotto/clipboard/cmd/gopaste',
            'github.com/kyoshidajp/ghkw',
            'github.com/motemen/ghq',
        ]))
        print('go getを終了します。')

if 'npm' in argv or 'all' in argv:
    if not which('npm'):
        print('npmコマンドが存在しません。')
    else:
        print('npm installを開始します。')
        system('npm install -g ' + ' '.join([
            'cspell',
            'datauri',
            'dev-ip',
            'gitopen',
            'http-server',
            'open-url',
            'prettier',
            'uuid',
            # 'browser-sync',
            # 'fixpack',
            # 'gtop',
            # 'html-validator-cli',
            # 'isutf8',
            # 'tldr',
        ]))
        print('npm installを終了します。')
