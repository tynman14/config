#!/bin/bash 

wlan_ip=`ip addr show | grep -A3 wlan  | grep inet | head -n1 | cut -c10-25 | sed 's/\/.*//'`
#echo ${wlan_ip}

if [ ${#wlan_ip} -gt 0 ] ; then
	echo "${wlan_ip}"
else
	echo "not connected"
fi
