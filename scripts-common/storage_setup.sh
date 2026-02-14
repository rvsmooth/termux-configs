#!/usr/bin/env bash

[ ! -d ~/storage/download ] &&
  echo "Storage permission is not setup" &&
  yes | termux-setup-storage &&
  sleep 10 &&
  mkdir ~/storage/downloads/termux-ytdl
