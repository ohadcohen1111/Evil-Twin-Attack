#!/bin/bash


interface=$1

sudo iw dev
sudo ip link set $interface down
sudo iw $interface set monitor none
sudo ip link set $interface up

