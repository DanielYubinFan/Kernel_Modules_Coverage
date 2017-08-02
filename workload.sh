#!/bin/bash
ping -c 1 -W 1 192.168.0.1

sudo ifconfig eth0 mtu 4000 up
sudo ethtool -G eth0 rx 4096 tx 4096

sudo vconfig add eth0 5
sudo ifconfig eth0.5 down
sudo vconfig rem eth0.5

sudo ifconfig eth0 hw ether 02:01:02:03:04:08


