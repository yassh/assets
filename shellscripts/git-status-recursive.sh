#!/bin/bash

git fetch && git status; echo ""
git submodule foreach --recursive 'git fetch && git status; echo ""'
