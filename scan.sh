#!/bin/bash

./setup.sh 

iwconfig
echo "Please write the name of the Interface: "
read interface

./monitor-mode.sh $interface 

echo "Press Ctrl + c to stop the scanning"
python scan-ap.py $interface

