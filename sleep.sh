#!/bin/bash
if [ "$1" == "true" ]; then
  sudo pmset -a disablesleep 0
  echo "sleep set to true"
elif [ "$1" == "false" ]; then
  sudo pmset -a disablesleep 1
  echo "sleep set to false"
elif [ "$1" == "ram" ]; then
  sudo pmset -a hibernatemode 0
  sudo pmset -a standby 0
#  sudo pmset -a autopoweroffdelay 604800
  sudo pmset -a autopoweroff 0
  sudo pmset schedule cancelall
#  sudo chflags schg /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist  # only works when wifi is disabled on going to sleep, otherwise it wakes up every few seconds
#  sudo chflags noschg /Library/Preferences/SystemConfiguration/com.apple.AutoWake.plist
  sudo pmset -a tcpkeepalive 0
  sudo pmset -a ttyskeepawake 0
  sudo pmset -a powernap 0
  sudo mdutil -i off
  sudo pmset -a darkwakes 0
#  sudo pmset dwlinterval 15  # default value, change if needed
elif [ "$1" == "swap" ]; then
  sudo pmset -a hibernatemode 3
  sudo pmset -a standby 1
  sudo pmset -a autopoweroff 1
  sudo pmset schedule cancelall
#  sudo pmset -a autopoweroffdelay 10800
  sudo pmset -a tcpkeepalive 0
  sudo pmset -a ttyskeepawake 0
  sudo pmset -a powernap 0
  sudo mdutil -i off
  sudo pmset -a darkwakes 0
#  sudo pmset dwlinterval 15  # default value, change if needed
elif [ "$1" == "log" ]; then
  pmset -g log | grep HibernateStats | tail -n 5
else
  echo "wrong argument!"
fi
