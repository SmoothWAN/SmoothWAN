#!/bin/sh

setupdev () {
	ip link set $1 down
	ip link set $1 name $2
	ip link set $2 up
	sleep 2
	echo c > /sys/class/net/eth0/queues/rx-0/rps_cpus
	echo c > /sys/class/net/eth0/queues/tx-0/xps_cpus
	echo c > /sys/class/net/eth0/queues/tx-1/xps_cpus
	echo c > /sys/class/net/eth0/queues/tx-2/xps_cpus
	echo c > /sys/class/net/eth0/queues/tx-3/xps_cpus
	echo c > /sys/class/net/eth0/queues/tx-4/xps_cpus
	#Checksum offload
	/usr/sbin/ethtool -K eth0 rx-checksum on
	/usr/sbin/ethtool -K eth0 tx-checksum-ipv4 on
}

while :
do

USB1name="$(uci get network.One.usename)"
USB2name="$(uci get network.Two.usename)"
USB3name="$(uci get network.Three.usename)"
USB4name="$(uci get network.Four.usename)"

#not using functions to concatenate different hubs
PATH13="/sys/bus/usb/devices/2-1:1.0"
PATH23="/sys/bus/usb/devices/2-2:1.0"
PATH1="/sys/bus/usb/devices/1-1.1:1.0"
PATH2="/sys/bus/usb/devices/1-1.2:1.0"
PATH3="/sys/bus/usb/devices/1-1.3:1.0"
PATH4="/sys/bus/usb/devices/1-1.4:1.0"
USB13="$(ls -l $PATH13/net | awk -F ' ' '{print $9}')"
USB23="$(ls -l $PATH23/net | awk -F ' ' '{print $9}')"
USB1="$(ls -l $PATH1/net | awk -F ' ' '{print $9}')"
USB2="$(ls -l $PATH2/net | awk -F ' ' '{print $9}')"
USB3="$(ls -l $PATH3/net | awk -F ' ' '{print $9}')"
USB4="$(ls -l $PATH4/net | awk -F ' ' '{print $9}')"

if [[ ${USB13} ]] && [[ ${USB13} != ${USB1name} ]]; then
		setupdev "${USB13}" "${USB1name}"
		logger -t mwanusb "Renamed USB1 (3.0+) to ${USB1name}"
	fi
if [[ ${USB23} ]] && [[ ${USB23} != ${USB2name} ]]; then
		setupdev "${USB23}" "${USB2name}"
		logger -t mwanusb "Renamed USB2 (3.0+) to ${USB2name}"
	fi
if [[ ${USB1} ]] && [[ ${USB1} != ${USB1name} ]]; then
		setupdev "${USB1}" "${USB1name}"
		logger -t mwanusb "Renamed USB1 to ${USB1name}"
	fi
if [[ ${USB2} ]] && [[ ${USB2} != ${USB2name} ]]; then
		setupdev "${USB2}" "${USB2name}"
		logger -t mwanusb "Renamed USB2 to ${USB2name}"
	fi
if [[ ${USB3} ]] && [[ ${USB3} != ${USB3name} ]]; then
		setupdev "${USB3}" "${USB3name}"
		uci set network.Three.device=${USB3name}
		logger -t mwanusb "Renamed USB3 to ${USB3name}"
	fi
if [[ ${USB4} ]] && [[ ${USB4} != ${USB4name} ]]; then
		setupdev "${USB4}" "${USB4name}"
		logger -t mwanusb "Renamed USB4 to ${USB4name}"
	fi

sleep 5
done
