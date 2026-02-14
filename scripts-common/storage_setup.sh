#!/usr/bin/env bash

[ ! -d $HOME/storage/download ] &&
  echo "Storage permission is not setup" &&
  yes | termux-setup-storage &&
  sleep 10 &&
  mkdir $HOME/storage/downloads/termux-ytdl
