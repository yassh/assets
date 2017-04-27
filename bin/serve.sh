#!/bin/bash

if [ $1 ]; then
  http-server -o -p $1
else
  http-server -o
fi
