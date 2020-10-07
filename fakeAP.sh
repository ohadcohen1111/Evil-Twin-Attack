RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'
printf "${RED}###Fake AP Script v0.1###\n${NC}"
echo "Starting..."
sudo service network-manager restart
sleep 3
printf "${RED}Checking status of dnsmasq and hostapd\n${NC}"
hostapdid="$(pidof dnsmasq)"
dnsmasqid="$(pidof hostapd)"
sudo service dnsmasq stop
sudo service hostapd stop
if [ "$dnsmasqid" != "" ]; then
    kill $dnsmasqid
    printf "${RED}Killing dnsmasq service\n${NC}"
fi
if [ "$hostapdid" != "" ]; then
    kill $hostapdid
    printf "${RED}Killing hostapd service\n${NC}"
fi
#echo "${RED}Killing\n${NC}"
ifconfig
printf "${CYAN}Select your device : ${NC}"
read device
printf "${CYAN}Choose AP name : ${NC}"
read name
printf "${CYAN}Select channel : ${NC}"
read channel
printf "${CYAN}Choose your source that provides internet connection : ${NC}"
read source
ifconfig $device 10.0.0.1/24 up
apt-get install dnsmasq
cd /
mkdir ap-script
cd ap-script
rm -f *
touch dnsmasq.conf
echo -e "interface=$device\ndhcp-range=10.0.0.10,10.0.0.250,12h\ndhcp-option=3,10.0.0.1\ndhcp-option=6,10.0.0.1\nserver=8.8.8.8\nlog-queries\nlog-dhcp" >> dnsmasq.conf
apt-get install hostapd
touch hostapd.conf
echo -e "interface=$device\ndriver=nl80211\nssid=$name\nchannel=$channel" >> hostapd.conf
netpid="$(pidof NetworkManager)"
dhpid="$(pidof dhclient)"
wpapid="$(pidof wpa_supplicant)"
kill $netpid && kill $dhpid && kill $wpapid
xterm -hold -e 'dnsmasq -C dnsmasq.conf -d' &
xterm -hold -e 'hostapd hostapd.conf' &
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -P FORWARD ACCEPT
sudo iptables --table nat -A POSTROUTING -o $source -j MASQUERADE
printf "Would you like to start WireShark (y/n) : "
read choose
if [ "$choose" == "y" ]; then
    xterm -hold -e 'wireshark' &
    printf "${RED}##${CYAN} Have Fun :) ${RED}##${NC}"
elif [ "$choose" == "n" ]; then
    printf "${RED}##${CYAN} Have Fun :) ${RED}##${NC}"
else 
    printf "${RED}##${CYAN} Have Fun :) ${RED}##${NC}"
fi
echo ""
