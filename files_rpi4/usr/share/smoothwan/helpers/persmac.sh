#!/bin/sh

while :
do
NET_LIST="$(ls /sys/class/net/*/device/uevent | awk -F '/' '{print $5}')"
sectionWAN="$(uci show network | awk -F '=' '{print $1}' | grep origindev)"

echo list:${NET_LIST}

for DEV in ${NET_LIST}
do
echo checking:$DEV
	if [[ ${DEV} != "eth0" ]] && [[ ${DEV} = eth* ]] || [[ ${DEV} = usb* ]] || [[ ${DEV} = wwan* ]]; then
		echo detect
		DEVS=$(printf '%s' "$DEV" | sed 's/[0-9]//g')
        	MAC="$(cat /sys/class/net/$DEV/address | awk -F: '{ print $4 $5 $6 }')"
		ip link set ${DEV} down
		ip link set ${DEV} name newdev-$MAC
		logger -t persmac "Changed interface name with MAC ID for $DEV to newdev-$MAC"
		echo "Changed potential WAN interface name with MAC ID for $DEV to newdev-$MAC"

	elif [[ ${DEV} = newdev* ]]; then
		for oldWAN in ${sectionWAN}
		do
			if [[ ${DEV} = "$(uci get $oldWAN)" ]]; then
				ip link set "$(uci get $oldWAN)" down
				newWAN="$(uci show network | awk '{print $1}' | grep $oldWAN | awk -F '.' '{print $2}')"
				uciSet="$(echo $oldWAN | awk -F '.' '{print $1"."$2".device"}')"
				ip link set "$(uci get $oldWAN)" name $newWAN
				ip link set $newWAN up
				uci set $uciSet=$newWAN
				uci commit
			fi
		done
	fi

		
done
sleep 1
done
