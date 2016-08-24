#!/bin/bash

echo "go getを開始します。"

go get -u \
github.com/atotto/clipboard/cmd/gocopy \
github.com/atotto/clipboard/cmd/gopaste \
github.com/motemen/ghq \
;

echo "go getを終了します。"
