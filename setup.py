#!/usr/bin/env python3

from os import path
from os import system
from shutil import which
from sys import platform

__dir__ = path.dirname(path.realpath(__file__))
__home__ = path.expanduser('~')

# setup dotfiles
system(path.join(__dir__, 'dotfiles', 'setup.sh'))

# install anyenv
if not path.exists(path.join(__home__, '.anyenv')):
    system('git clone https://github.com/riywo/anyenv ~/.anyenv')

# install ndenv
if not which('ndenv'):
    system('anyenv install ndenv')

# install phpenv
if not which('phpenv'):
    system('anyenv install phpenv')

# install nodescripts
system('cd {} && npm install'.format(path.join(__dir__, 'nodescripts')))

# install packages
system('package-install.py all')

# install fzf
if not path.exists(path.join(__home__, '.fzf')):
    system('git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf')
    system('~/.fzf/install')

# install micro
if not which('micro'):
    if platform.startswith('linux'):
        if not path.exists(path.join(__home__, 'bin')):
            system('mkdir ~/bin')
        system('curl -sL https://gist.githubusercontent.com/zyedidia/d4acfcc6acf2d0d75e79004fa5feaf24/raw/a43e603e62205e1074775d756ef98c3fc77f6f8d/install_micro.sh | bash -s linux64 ~/bin')
