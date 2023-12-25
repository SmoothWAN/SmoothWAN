#!/bin/sh
# A small script to make life with iPhone tethering less cumbersome on OpenWrt
# Petr Vyskocil, Apr 2020
# Public domain
 
# After you successfully allow iPhone tethering, copy files with name like
# /var/lib/lockdown/12345678-9ABCDEF012345678.plist to /etc/lockdown/locks.
# That way, you won't have to set up trust again after router reboots.
if [ -e /etc/lockdown/locks ]
then
    mkdir -p /var/lib/lockdown
    cp -f /etc/lockdown/locks/* /var/lib/lockdown/
fi
 
# lockdown records restored, now we can launch usbmuxd. Don't launch it sooner!
usbmuxd
 
# We are up and running now. But unfortunately if your carrier signal is weak, iPhone will
# drop connection from time to time and you'd have to unplug and replug USB cable to start tethering
# again. Script below automates that activity.
 
# First wait a bit - we just brought the interface up by usbmuxd
sleep 20
 
# If we see iPhone ethernet interface, try to ping iPhone router's address (172.20.10.1).
# When the ping is unsuccessful, rebind iPhone ethernet USB driver and wait for things to settle down
while :
do
    for i in /sys/bus/usb/drivers/ipheth/*:*
    do
        test -e "${i}" || continue
        ping -w 3 172.20.10.1 &> /dev/null
        if [ "${?}" -ne 0 ]; then
            echo "${i##*/}" > "${i%/*}"/unbind
            echo "${i##*/}" > "${i%/*}"/bind
            sleep 20
        fi
    done
    sleep 1
done