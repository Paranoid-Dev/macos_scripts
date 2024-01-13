#!/bin/bash

if [ "$1" == "-l" ]; then
  du -h -d 1 ~/ | grep '[0-9]\+G' | sort -nr
elif [ "$1" == "-la" ]; then
  du -sh -- *
elif [ "$1" == "health" ]; then
  smartctl -a disk0
else
  df -h .
fi
