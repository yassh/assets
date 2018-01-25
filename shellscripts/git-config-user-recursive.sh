#!/bin/bash

git config user.name "yassh" && git config user.email "yassh32@outlook.jp"
git submodule foreach --recursive 'git config user.name "yassh" && git config user.email "yassh32@outlook.jp"'
