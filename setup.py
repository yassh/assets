#!/usr/bin/env python3

from os import system
from os import path
from shutil import which

__dir__ = path.dirname(path.realpath(__file__))
__home__ = path.expanduser('~')

# setup dotfiles
system(path.join(__dir__, 'dotfiles', 'setup.sh'))

# install anyenv
if not path.exists(path.join(__home__, '.anyenv')):
    system('git clone https://github.com/riywo/anyenv ~/.anyenv')

# install ndenv and Node.js
if not which('ndenv'):
    system('anyenv install ndenv')
    system('ndenv install v8 && ndenv global v8 && ndenv rehash')

# install packages
system('package-install.py all')

# install nodescripts
system('cd {} && npm install'.format(path.join(__dir__, 'nodescripts')))
