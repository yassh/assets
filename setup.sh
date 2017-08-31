#!/bin/bash

__DIR__=$(dirname "$(which "$0")")

"$__DIR__/dotfiles/setup.sh"

# https://github.com/rcmdnk/trash
curl -fsSL https://raw.github.com/rcmdnk/trash/install/install.sh| sh

if test ! -e ~/.anyenv; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
fi

"$__DIR__/pyscripts/package-install.py"

cd "$__DIR__/nodescripts" && npm install
