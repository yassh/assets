#!/usr/bin/env python3

from sys import argv
from os import system

if 'apt' in argv or 'all' in argv:
  print('apt-get installを開始します。')
  system('sudo apt-get update')
  system('sudo apt-get install -y ' + ' '.join([
    'ranger',
    'silversearcher-ag',
    'tig',
  ]))
  print('apt-get installを終了します。')

if 'pip' in argv or 'all' in argv:
  print('pip installを開始します。')
  system('sudo pip install ' + ' '.join([
    'pylint',
    'thefuck',
  ]))
  print('pip installを終了します。')

if 'go' in argv or 'all' in argv:
  print('go getを開始します。')
  system('go get ' + ' '.join([
    'github.com/atotto/clipboard/cmd/gocopy',
    'github.com/atotto/clipboard/cmd/gopaste',
    'github.com/motemen/ghq',
  ]))
  print('go getを終了します。')

if 'npm' in argv or 'all' in argv:
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
