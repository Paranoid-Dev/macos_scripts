#!/bin/bash

tmutil listbackups -d /Volumes/timemachine_sparsebundle/

echo ""
echo "Enter time id of backup you want to delete"
echo -n '> > > '
read x
sudo tmutil delete -d /Volumes/timemachine_sparsebundle/ -t "$x"
