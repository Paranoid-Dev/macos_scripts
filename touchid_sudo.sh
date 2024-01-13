#!/bin/bash
sudo_file='# sudo: auth account password session
auth       sufficient     pam_tid.so
auth       include        sudo_local
auth       sufficient     pam_smartcard.so
auth       required       pam_opendirectory.so
account    required       pam_permit.so
password   required       pam_deny.so
session    required       pam_permit.so'

echo '** previous sudo file **'
echo ''
cat /etc/pam.d/sudo
echo ''

echo '** overwriting with: **'
echo ''
echo "$sudo_file"
echo ''

for ((;;)); do
  echo 'CONTINUE? [Y/n]'
  read x
  if [ "$x" == "y" ] || [ "$x" == "Y" ] || [ "$x" == "" ]; then
    echo 'overwriting /etc/pam.d/sudo'
    echo "$sudo_file" > /etc/pam.d/sudo
    break
  elif [ "$x" == "n" ] || [ "$x" == "N" ]; then
    echo 'overwrite aborted'
    break
  else
    echo wrong input
  fi
done

