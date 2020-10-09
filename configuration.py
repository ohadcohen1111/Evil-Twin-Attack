#!/bin/python

import os
import sys

#create hostapt
try:
    os.remove("hostapd.conf")
except:
    pass

hostapd=open("hostapd.conf", "a+")
hostapd.write("#Set wifi interface\n")
hostapd.write("interface="+sys.argv[1]+"\n")
hostapd.write("\n#Set network name\n")
hostapd.write("ssid="+sys.argv[2]+"\n")
hostapd.write("\n#Set channel\n")
hostapd.write("channel=1\n")
hostapd.write("\n#Set driver\n")
hostapd.write("driver=nl80211\n")
hostapd.close()


#create dnsmasq
try:
    os.remove("dnsmasq.conf")
except:
    pass

dnsmasq=open("dnsmasq.conf", "a+")
dnsmasq.write("#Set the wifi interface\n")
dnsmasq.write("interface="+sys.argv[1]+"\n")
dnsmasq.write("\n#Set the IP range that can be given to clients\n")
dnsmasq.write("dhcp-range=10.0.0.10,10.0.0.100,8h\n")
dnsmasq.write("\n#Set the gateway IP address\n")
dnsmasq.write("dhcp-option=3,10.0.0.1\n")
dnsmasq.write("\n#Set dns server address\n")
dnsmasq.write("dhcp-option=6,10.0.0.1\n")
dnsmasq.write("\n#Redirect all requests to 10.0.0.1\n")
dnsmasq.write("address=/#/10.0.0.1\n")
dnsmasq.close()

