#!/bin/bash

if test $# -eq 0; then
  gocopy
else
  echo -n "$*" | gocopy && echo "Copied: $*" # *1
fi

# *1 echo -n: do not output the trailing newline
