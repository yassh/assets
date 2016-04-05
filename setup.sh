#!/bin/bash

# http://ja.stackoverflow.com/questions/17274
__DIR__=$(cd $(dirname $0) && pwd)

$__DIR__/dotfiles/setup.sh

$__DIR__/bin/brew-install.sh
$__DIR__/bin/gem-install.sh
$__DIR__/bin/npm-install.sh

cd $__DIR__/nodescripts && npm link
