#!/bin/bash

git config user.name "yassh" && git config user.email "yassh32@outlook.jp"
git submodule foreach 'git config user.name "yassh" && git config user.email "yassh32@outlook.jp"'
