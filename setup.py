#!/usr/bin/env python3

from os import path
from os import system
from shutil import which
from sys import platform

__dir__ = path.dirname(path.realpath(__file__))
__home__ = path.expanduser('~')

# setup dotfiles
system(path.join(__dir__, 'dotfiles', 'setup.sh'))

# install fzf
if not path.exists(path.join(__home__, '.fzf')):
    system('git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf')
    system('~/.fzf/install')

# install anyenv
if not path.exists(path.join(__home__, '.anyenv')):
    system('git clone https://github.com/riywo/anyenv ~/.anyenv')
    system('~/.anyenv/bin/anyenv init')

# install nodenv
if not which('nodenv'):
    system('anyenv install nodenv')

# install nodescripts
system('cd {} && npm install'.format(path.join(__dir__, 'nodescripts')))

# install packages
system('package-install.py all')
