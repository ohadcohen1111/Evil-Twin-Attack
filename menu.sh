#!/bin/bash


Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

NC='\033[0m' # No Color
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White
# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

while true
do
	clear
printf "\n"     
printf "\e[1;77${BGreen}8888888888   88             88 8888  88           8888888888  88                   88  8888  8888      88      \n" 
printf "\e[1;77m888           88           88   88   88               88       88                 88    88   88 88     88   \n"
printf "\e[1;77m888            88         88    88   88               88        88               88     88   88  88    88       \n"
printf "\e[1;77m8888888888      88       88     88   88               88         88     88      88      88   88   88   88              \n"
printf "\e[1;77m888              88     88      88   88               88          88   88 88   88       88   88    88  88       \n"
printf "\e[1;77m888               88  88        88   88               88           88 88   88 88        88   88     88 88    \n"
printf "\e[1;77m8888888888          888        8888  88888888         88            888     888        8888  88      8888      \n"
printf "\n \n"

printf "\e${Purple}                                                         https://github.com/ohadcohen1111/Evil-Twin-Attack \n"
printf "\e                                                                                     Ohad Cohen, Amit Elbaz \n \n"
 

	echo -e "${BICyan}Enter ${BIRed}1${BICyan} to Install: "
	echo -e "Enter ${BIRed}2${BICyan} to Scan Access Point: "
	echo -e "Enter ${BIRed}3${BICyan} to Start Evil Twin Attack: "
	echo -e "Enter ${BIRed}4${BICyan} to Start Evil Twin Protection: "
	echo -e "Enter ${BIRed}q${BICyan} to Exit the Menu: "
	echo -e "\n"
	echo -e "${BIRed}Enter your selection:${NC} \c"
	read answer
	case "$answer" in
		1) ./setup.sh ;;
        2) ./scan.sh ;;
		3) ./evil-twin.sh ;;
		4) ./protection.sh ;;
		q) exit ;;
	esac
	echo -e "${BIRed}Enter return to continue${NC} \c"
	read input
done
