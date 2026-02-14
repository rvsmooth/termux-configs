#!/usr/bin/env bash

[ ! -d ~/storage/download ] && echo "Storage permission is not setup" \
  termux-setup-storage && mkdir ~/storage/download/termux-ytdl
