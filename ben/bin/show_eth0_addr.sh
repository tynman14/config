#!/bin/bash 

eth_ip=`ip addr show | grep -A2 eth0 | grep 'inet ' | cut -c10-25 | sed 's/\/.*//'`

if [ ${#eth_ip} -gt 0 ] ; then
	echo "${eth_ip}"
else
	echo "not connected"
fi
