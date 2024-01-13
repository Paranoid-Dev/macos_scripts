#!/bin/bash

# Dependencies
# battery
# https://github.com/actuallymentor/battery
# 
# brightness
# https://github.com/nriley/brightness

if [ "$1" == 'stop' ]; then
  battery maintain stop
  launchctl stop com.battery.app
elif [ "$1" == 'see' ]; then
  ps -ef | grep battery
elif [ "$1" == 'low_power_off' ]; then
  [[ $(brightness -l) =~ (0\..*|1.0.*) ]] && last_brightness="${BASH_REMATCH[1]}"
  sudo pmset -a lowpowermode 0
  sleep 0.3 # takes ~0.3 seconds for low powermode to change brightness on m1pro, may differ for other cpu models
  brightness "$last_brightness"
elif [ "$1" == 'low_power_on' ]; then
  [[ $(brightness -l) =~ (0\..*|1.0.*) ]] && last_brightness="${BASH_REMATCH[1]}"
  sudo pmset -b lowpowermode 1
  sleep 0.3 # takes ~0.3 seconds for low powermode to change brightness on m1pro, may differ for other cpu models
  brightness "$last_brightness"
elif [ "$1" == 'health' ]; then
  ioreg -l -r -n AppleSmartBatteryManager | grep Capacity
elif (($1>20)); then
  if (($1<101)); then
    battery maintain stop
    launchctl stop com.battery.app
    battery maintain $1
    battery status
  else
    echo integer cannot be more than 100
  fi
else
  echo integer cannot be less than 20
fi
