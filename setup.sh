#!/bin/bash

# http://ja.stackoverflow.com/questions/17274
__DIR__=$(cd $(dirname $0) && pwd)

$__DIR__/dotfiles/setup.sh

if [ ! -e ~/.anyenv ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

$__DIR__/bin/brew-install.sh
$__DIR__/bin/go-get.sh
$__DIR__/bin/npm-install.sh
$__DIR__/bin/pip-install.sh

cd $__DIR__/nodescripts && npm link
