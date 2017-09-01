#!/usr/bin/env python3

from os import system
from shutil import which
from sys import argv

if 'apt' in argv or 'all' in argv:
    if not which('apt-get'):
        print('apt-getコマンドが存在しません。')
    else:
        print('apt-get updateを開始します。')
        system('sudo apt-get update')
        system('sudo apt-get upgrade -y')
        system('sudo apt-get clean')
        system('sudo apt-get autoclean')
        print('apt-get updateを終了します。')

if 'brew' in argv or 'all' in argv:
    if not which('brew'):
        print('brewコマンドが存在しません。')
    else:
        print('brew updateを開始します。')
        system('brew update')
        system('brew upgrade')
        system('brew cleanup')
        print('brew updateを終了します。')

if 'cask' in argv or 'all' in argv:
    if not which('brew'):
        print('brewコマンドが存在しません。')
    else:
        print('brew cask updateを開始します。')
        system('brew tap buo/cask-upgrade')
        system('brew update')
        system('brew cu -y --cleanup')
        print('brew cask updateを終了します。')

if 'npm' in argv or 'all' in argv:
    if not which('npm'):
        print('npmコマンドが存在しません。')
    else:
        print('npm updateを開始します。')
        system('npm update -g')
        print('npm updateを終了します。')
