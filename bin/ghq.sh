#!/bin/bash

__DIR__=$(dirname "$(which "$0")")

result=$(ghq list 2> /dev/null | "$__DIR__/fzf.sh" "$*") && echo "$(ghq root)/$result"
