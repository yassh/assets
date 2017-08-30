#!/bin/bash

__DIR__=$(dirname "$(which "$0")")

"$__DIR__/dotfiles/setup.sh"

# https://github.com/rcmdnk/trash
curl -fsSL https://raw.github.com/rcmdnk/trash/install/install.sh| sh

if test ! -e ~/.anyenv; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

"$__DIR__/shellscripts/package-install.sh"
"$__DIR__/shellscripts/go-get.sh"
"$__DIR__/shellscripts/npm-install.sh"
"$__DIR__/shellscripts/pip-install.sh"

cd "$__DIR__/nodescripts" && npm install
