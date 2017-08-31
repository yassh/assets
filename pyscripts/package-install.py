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
            'ranger',
            'silversearcher-ag',
            'tig',
        ]))
        print('apt-get installを終了します。')

if 'pip' in argv or 'all' in argv:
    if not which('pip'):
        print('pipコマンドが存在しません。')
    else:
        print('pip installを開始します。')
        system('sudo pip install ' + ' '.join([
            'autopep8',
            'hacking',
            'thefuck',
        ]))
        print('pip installを終了します。')

if 'go' in argv or 'all' in argv:
    if not which('go'):
        print('goコマンドが存在しません。')
    else:
        print('go getを開始します。')
        system('go get ' + ' '.join([
            'github.com/atotto/clipboard/cmd/gocopy',
            'github.com/atotto/clipboard/cmd/gopaste',
            'github.com/motemen/ghq',
        ]))
        print('go getを終了します。')

if 'npm' in argv or 'all' in argv:
    if not which('npm'):
        print('npmコマンドが存在しません。')
    else:
        print('npm installを開始します。')
        system('npm install -g ' + ' '.join([
            'browser-sync',
            'cspell',
            'datauri',
            'dev-ip',
            'eslint-config-airbnb-base',
            'eslint-plugin-import',
            'eslint',
            'fixpack',
            'gitopen',
            'http-server',
            'isutf8',
            'npm-run-all',
            'open-url',
            'prettier',
            'tldr',
        ]))
        print('npm installを終了します。')
