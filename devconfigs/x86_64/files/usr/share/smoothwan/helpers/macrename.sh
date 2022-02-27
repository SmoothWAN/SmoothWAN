#!/bin/sh

while :
do
netdev_list="$(ls /sys/class/net/*/device/uevent | awk -F '/' '{print $5}')"
sectionWAN="$(uci show network | grep usemac | awk -F '.' '{ print $2}')"

for netdev in ${netdev_list}
do
	devmac="$(cat /sys/class/net/$netdev/address)"
	for ifdev in ${sectionWAN}
	do
		ifmac="$(uci get network.$ifdev.usemac | awk '{ print tolower($0)}')"
		ucidev="$(uci -q get network.$ifdev.device)"
		if [[ ${devmac} == ${ifmac} ]] && [[ $ifdev != "$ucidev" ]]; then
			ip link set $netdev down
			ip link set $netdev name $ifdev
			ip link set $ifdev up
			uci set network.$ifdev.device=$ifdev
			uci commit network
			uci commit firewall
			logger -t smwan "$netdev -> $ifdev"
		fi
	done
done
sleep 1
done
