#!/bin/bash

__DIR__=$(dirname "$(which "$0")")

script=$(npm run | grep '^  \S' | sed -e 's/^  //g' | "$__DIR__/fzf.sh" "$*") && npm run $script
