#!/bin/bash
if [ "$1" == "true" ]; then
  sudo pmset -a disablesleep 0
#  sudo pmset -a sleep 1
  echo "sleep set to true"
elif [ "$1" == "false" ]; then
  sudo pmset -a disablesleep 1
#  sudo pmset -a sleep 0
  echo "sleep set to false"
elif [ "$1" == "ram" ]; then
  sudo pmset -a hibernatemode 0
  sudo pmset -a standby 0
  sudo pmset -a autopoweroffdelay 604800
  sudo pmset -a autopoweroff 0
#  sudo pmset -a tcpkeepalive 0
elif [ "$1" == "swap" ]; then
  sudo pmset -a hibernatemode 3
  sudo pmset -a standby 1
  sudo pmset -a autopoweroff 1
  sudo pmset -a autopoweroffdelay 10800
elif [ "$1" == "log" ]; then
  pmset -g log | grep HibernateStats | tail -n 5
else
  echo "wrong argument!"
fi

