#!/bin/sh
INTERFACE=$1
MAC_WAN="30:f7:d7:01:52:ec"
MAC_LAN="7c:c2:c6:1e:2d:79"

CURRENT_MAC=$(ifconfig "$INTERFACE" | grep ether | awk '{print $2}')

if [ "$CURRENT_MAC" = "$MAC_WAN" ]; then
    /sbin/ifconfig "$INTERFACE" name usbwan
    logger "USB-NIC: Renamed $INTERFACE ($CURRENT_MAC) to usbwan"
elif [ "$CURRENT_MAC" = "$MAC_LAN" ]; then
    /sbin/ifconfig "$INTERFACE" name usblan
    logger "USB-NIC: Renamed $INTERFACE ($CURRENT_MAC) to usblan"
fi
