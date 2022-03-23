#!/bin/sh

while :
do

USB1name="$(uci get network.One.usename)"
USB2name="$(uci get network.Two.usename)"
USB3name="$(uci get network.Three.usename)"
USB4name="$(uci get network.Four.usename)"

USB13="$(ls -l /sys/bus/usb/devices/2-1:1.0/net | awk -F ' ' '{print $9}')"
USB23="$(ls -l /sys/bus/usb/devices/2-2:1.0/net | awk -F ' ' '{print $9}')"
USB1="$(ls -l /sys/bus/usb/devices/1-1.1:1.0/net | awk -F ' ' '{print $9}')"
USB2="$(ls -l /sys/bus/usb/devices/1-1.2:1.0/net | awk -F ' ' '{print $9}')"
USB3="$(ls -l /sys/bus/usb/devices/1-1.3:1.0/net | awk -F ' ' '{print $9}')"
USB4="$(ls -l /sys/bus/usb/devices/1-1.4:1.0/net | awk -F ' ' '{print $9}')"

if [[ ${USB13} ]] && [[ ${USB13} != ${USB1name} ]]; then
		ip link set ${USB13} down
		ip link set ${USB13} name ${USB1name}
		ip link set ${USB1name} up
		ifup ${USB1name}
		uci set network.One.device=${USB1name}
		uci commit network
		logger -t swan "Renamed USB1 (3.0+) to ${USB1name}"
	fi
if [[ ${USB23} ]] && [[ ${USB23} != ${USB2name} ]]; then
		ip link set ${USB23} down
		ip link set ${USB23} name ${USB2name}
		ip link set ${USB2name} up
		ifup ${USB2name}
		uci set network.Two.device=${USB2name}
		uci commit network
		logger -t swan "Renamed USB2 (3.0+) to ${USB2name}"
	fi
if [[ ${USB1} ]] && [[ ${USB1} != ${USB1name} ]]; then
		ip link set ${USB1} down
		ip link set ${USB1} name ${USB1name}
		ip link set ${USB1name} up
		ifup ${USB1name}
		uci set network.One.device=${USB1name}
                uci commit network
		logger -t swan "Renamed USB1 to ${USB1name}"
	fi
if [[ ${USB2} ]] && [[ ${USB2} != ${USB2name} ]]; then
		ip link set ${USB2} down
		ip link set ${USB2} name ${USB2name}
		ip link set ${USB2name} up
		ifup ${USB2name}
		uci set network.Two.device=${USB2name}
                uci commit network
		logger -t swan "Renamed USB2 to ${USB2name}"
	fi
if [[ ${USB3} ]] && [[ ${USB3} != ${USB3name} ]]; then
		ip link set ${USB3} down
		ip link set ${USB3} name ${USB3name}
		ip link set ${USB3name} up
		ifup ${USB3name}
		uci set network.Three.device=${USB3name}
                uci commit network
		logger -t swan "Renamed USB3 to ${USB3name}"
	fi
if [[ ${USB4} ]] && [[ ${USB4} != ${USB4name} ]]; then
		ip link set ${USB4} down
		ip link set ${USB4} name ${USB4name}
		ip link set ${USB4name} up
		uci set network.Four.device=${USB4name}
                uci commit network
		ifup ${USB4name}
		logger -t swan "Renamed USB4 to ${USB4name}"
	fi

sleep 5
done
