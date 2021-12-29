#!/bin/sh  /etc/rc.common

. /lib/functions.sh

ACTION="${1:-start}"
PKGS=/tmp/spdpkgs

config_load speedifyconf

run_speedify (){
   cd /usr/share/speedify || exit 1
   sh DisableRpFilter.sh 
   mkdir -p logs
   ./speedify -d logs &
}

parse_apt_url(){
   APT=$(config_get Setup apt)
   APT=$(echo $APT | sed -e 's/\/$//')
   echo RepoUser:$APT
   aptURL="$APT$SPDDIR"
   echo ParsedURL:$aptURL
   curl -o $PKGS $aptURL
   
   DWVER=$(awk '/Version:/{gsub("Version: ", "");print;exit}' $PKGS)
   echo RepoVer:$DWVER
   
   SPDDW=$(awk '/Filename/{gsub("Filename: ", "");print;exit}' $PKGS)
   export DWURL=$APT/$SPDDW
   echo SpdDownloadURL:$DWURL
   
   UIDW=$(sed -n '/speedifyui/{nnnnnnnn;p;q}' $PKGS | awk '/Filename/{gsub("Filename: ", "");print;exit}')
   export UIDWURL=$APT/$UIDW
   echo UIDownloadURL:$UIDWURL

}

installall(){
   if [ "$(ping -q -c1 google.com &>/dev/null && echo 0 || echo 1)" = "1" ]; then
        echo "Internet connectivity issue. Stopping installation/update"
        run_speedify
        exit 0
   fi


   rm -rf /tmp/spddw
   echo "Downloading Speedify"
   wget -P /tmp/spddw/speedify/ "$DWURL"
   echo "Downloading Speedify UI"
   wget -P /tmp/spddw/speedifyui/ "$UIDWURL"
   echo "Extracting Speedify"
   cd /tmp/spddw/speedify/
   ar x *.deb
   tar -xzf data.tar.gz -C /
   mkdir -p /usr/share/speedify/logs
   echo "Extracting Speedify UI"
   cd /tmp/spddw/speedifyui/
   ar x *.deb
   tar -xzf data.tar.gz -C /
   ln -sf /usr/share/speedifyui/files/* /www/spdui/
   echo "Deleting download cache"
   rm -rf /tmp/spddw
   echo "Updating configuration -tmash"
   uci set speedifyconf.Setup.version=$DWVER
   uci commit
   chmod 755 /etc/init.d/speedifyconf
   /etc/init.d/speedifyconf enable
   echo "Speedify is installed, UI is now available in Status->Overview"
}


if [ $(uname -m) = "aarch64" ]; then 
  SPDDIR="/dists/speedify/main/binary-arm64/Packages"
  else
  SPDDIR="/dists/speedify/main/binary-amd64/Packages"
fi    
   
   
if [ "$ACTION" = "update" ]; then
  parse_apt_url
  installall
  killall -KILL speedify
  run_speedify
else
  if [ "$ACTION" = "stopkill" ]; then
    echo "Killing Speedify"
    killall -KILL speedify
    exit 0
  fi
  echo "Starting Speedify"
  AUPD=$(config_get Setup autoupdate)
  if [ "$AUPD" = 1 ]; then
    echo "Update on boot enabled."
    parse_apt_url
    CURRVER=$(config_get Setup version | awk -F '|' -v 'OFS=|' '{ gsub(/[^0-9]/,"",$NF); print}')
    DWVER=$(echo $DWVER | awk -F '|' -v 'OFS=|' '{ gsub(/[^0-9]/,"",$NF); print}')
    echo "Current version: $CURRVER"
    echo "Repo version: $DWVER"
    if [ "$DWVER" -gt "$CURRVER" ]; then
        installall
        killall -KILL speedify
        run_speedify
        echo "Update finished, running."
        exit 0
    else
        echo "Up to date, running."
        killall -KILL speedify
        run_speedify
        exit 0
    fi
  else
    killall -KILL speedify
    run_speedify
    echo "Running"
 fi
fi
