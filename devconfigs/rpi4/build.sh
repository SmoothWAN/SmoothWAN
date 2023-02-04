make image PROFILE="rpi-4" FILES="files" PACKAGES="adb adb-enablemodem ar aria2 ath9k-htc-firmware apache-utils base-files bcm27xx-gpu-fw bcm27xx-userland binutils bluez-libs bnx2-firmware bnx2x-firmware brcmfmac-firmware-usb busybox bzip2 ca-bundle ca-certificates cgi-io chat comgt comgt-ncm curl cypress-firmware-43455-sdio cypress-nvram-43455-sdio-rpi-4b dbus diffutils dmesg dnsmasq-full dropbear e100-firmware e2fsprogs edgeport-firmware etherwake file firewall flock fstools fwtool getopt getrandom git glib2 gre hostapd-common i2c-tools ip-full ip-tiny ip6tables iperf3 ipset iptables iptables-mod-conntrack-extra iptables-mod-ipopt iw iwinfo iwlwifi-firmware-iwl100 iwlwifi-firmware-iwl1000 iwlwifi-firmware-iwl105 iwlwifi-firmware-iwl135 iwlwifi-firmware-iwl2000 iwlwifi-firmware-iwl2030 iwlwifi-firmware-iwl3160 iwlwifi-firmware-iwl3168 iwlwifi-firmware-iwl5000 iwlwifi-firmware-iwl5150 iwlwifi-firmware-iwl6000g2 iwlwifi-firmware-iwl6000g2a iwlwifi-firmware-iwl6000g2b iwlwifi-firmware-iwl6050 iwlwifi-firmware-iwl7260 iwlwifi-firmware-iwl7265 iwlwifi-firmware-iwl7265d iwlwifi-firmware-iwl8260c iwlwifi-firmware-iwl8265 iwlwifi-firmware-iwl9000 iwlwifi-firmware-iwl9260 jshn jsonfilter kernel kmod-8139cp kmod-8139too kmod-alx  kmod-arptables kmod-ata-ahci kmod-ata-marvell-sata kmod-ata-piix kmod-ata-sil kmod-ata-sil24 kmod-ata-via-sata kmod-ath kmod-ath10k-ct kmod-ath6kl kmod-ath6kl-usb kmod-ath9k-common kmod-ath9k-htc kmod-atl1 kmod-atl1c kmod-atl1e kmod-atl2 kmod-b44 kmod-be2net kmod-block2mtd kmod-bluetooth kmod-bnx2 kmod-bnx2x kmod-br-netfilter kmod-brcmfmac kmod-brcmutil kmod-cfg80211 kmod-crypto-acompress kmod-crypto-aead kmod-crypto-arc4 kmod-crypto-authenc kmod-crypto-cbc kmod-crypto-ccm kmod-crypto-cmac kmod-crypto-crc32 kmod-crypto-crc32c kmod-crypto-ctr kmod-crypto-cts kmod-crypto-deflate kmod-crypto-des kmod-crypto-ecb kmod-crypto-ecdh kmod-crypto-echainiv kmod-crypto-fcrypt kmod-crypto-gcm kmod-crypto-gf128 kmod-crypto-ghash kmod-crypto-hash kmod-crypto-hmac kmod-crypto-hw-geode kmod-crypto-hw-hifn-795x kmod-crypto-hw-padlock kmod-crypto-hw-talitos kmod-crypto-kpp kmod-crypto-lib-blake2s kmod-crypto-lib-chacha20 kmod-crypto-lib-chacha20poly1305 kmod-crypto-lib-curve25519 kmod-crypto-lib-poly1305 kmod-crypto-manager kmod-crypto-md4 kmod-crypto-md5 kmod-crypto-michael-mic kmod-crypto-misc kmod-crypto-null kmod-crypto-pcbc kmod-crypto-pcompress kmod-crypto-rmd160 kmod-crypto-rng kmod-crypto-seqiv kmod-crypto-sha1 kmod-crypto-sha256 kmod-crypto-sha512 kmod-crypto-test kmod-crypto-user kmod-crypto-wq kmod-crypto-xcbc kmod-crypto-xts kmod-cryptodev kmod-dax kmod-dm9000 kmod-e100 kmod-e1000 kmod-e1000e kmod-ebtables kmod-ebtables-ipv4 kmod-ebtables-ipv6 kmod-ebtables-watchers kmod-eeprom-93cx6 kmod-et131x kmod-ethoc kmod-fb kmod-fb-sys-fops kmod-fb-sys-ram kmod-fb-tft kmod-fb-tft-ili9486 kmod-firewire kmod-firewire-net kmod-firewire-ohci kmod-firewire-sbp2 kmod-forcedeth kmod-fs-btrfs kmod-fs-cifs kmod-fs-configfs kmod-fs-cramfs kmod-fs-exfat kmod-fs-exportfs kmod-fs-ext4 kmod-fs-f2fs kmod-fs-hfs kmod-fs-hfsplus kmod-fs-isofs kmod-fs-jfs kmod-fs-ksmbd kmod-fs-msdos kmod-fs-nfs kmod-fs-nfs-common kmod-fs-nfs-common-rpcsec kmod-fs-nfs-v3 kmod-fs-nfs-v4 kmod-fs-nfsd kmod-fs-ntfs kmod-fs-reiserfs kmod-fs-squashfs kmod-fs-udf kmod-fs-vfat kmod-fs-xfs kmod-fuse kmod-gre kmod-gre6 kmod-hwmon-core kmod-hwmon-raspberrypi kmod-hwmon-rpi-poe-fan kmod-i40e kmod-iavf kmod-ifb kmod-igb kmod-igc kmod-input-evdev kmod-input-gpio-encoder kmod-input-gpio-keys kmod-input-gpio-keys-polled kmod-input-joydev kmod-input-matrixkmap kmod-input-polldev kmod-input-touchscreen-ads7846 kmod-input-uinput kmod-iosched-bfq kmod-ipip kmod-ipoa kmod-ipsec kmod-ipsec4 kmod-ipt-checksum kmod-ipt-cluster kmod-ipt-clusterip kmod-ipt-conntrack kmod-ipt-conntrack-extra kmod-ipt-conntrack-label kmod-ipt-core kmod-ipt-extra kmod-ipt-filter kmod-ipt-hashlimit kmod-ipt-ipopt kmod-ipt-iprange kmod-ipt-ipsec kmod-ipt-ipset kmod-ipt-led kmod-ipt-nat kmod-ipt-nat-extra kmod-ipt-nat6 kmod-ipt-nflog kmod-ipt-nfqueue kmod-ipt-offload kmod-ipt-physdev kmod-ipt-raw kmod-ipt-rpfilter kmod-ipt-tee kmod-ipt-tproxy kmod-ipt-u32 kmod-ipt-ulog kmod-iptunnel kmod-iptunnel4 kmod-iptunnel6 kmod-iscsi-initiator kmod-isdn4linux kmod-iwlwifi kmod-ixgbe kmod-ixgbevf kmod-l2tp kmod-l2tp-eth kmod-l2tp-ip kmod-leds-gpio kmod-leds-pca963x kmod-ledtrig-activity kmod-ledtrig-gpio kmod-ledtrig-oneshot kmod-ledtrig-transient kmod-lib80211 kmod-libertas-usb kmod-loop kmod-mac80211 kmod-macremapper kmod-macsec kmod-macvlan kmod-md-linear kmod-mii kmod-misdn kmod-mlx4-core kmod-mlx5-core kmod-mmc kmod-mpls kmod-mppe kmod-mt7601u kmod-natsemi kmod-nbd kmod-ne2k-pci kmod-netem kmod-netlink-diag kmod-nf-conntrack kmod-nf-conntrack-netlink kmod-nf-conntrack6 kmod-nf-flow kmod-nf-ipt kmod-nf-nat kmod-nf-nathelper kmod-nf-nathelper-extra kmod-nf-reject kmod-nfnetlink kmod-nfnetlink-log kmod-nfnetlink-queue kmod-nft-arp kmod-nft-bridge kmod-nft-core kmod-nft-nat kmod-nft-nat6 kmod-nft-netdev kmod-nft-offload kmod-nft-queue kmod-niu kmod-nlmon kmod-p54-common kmod-p54-usb kmod-pcnet32 kmod-phy-bcm84881 kmod-phy-broadcom kmod-phy-realtek kmod-phylib-broadcom kmod-phylink kmod-pktgen kmod-ppp kmod-ppp-synctty kmod-pppoa kmod-pppoe kmod-pppol2tp kmod-pppox kmod-pps kmod-pptp kmod-ptp kmod-pwm-bcm2835 kmod-r6040 kmod-r8169 kmod-rsi91x kmod-rsi91x-usb kmod-rt2500-usb kmod-rt2800-lib kmod-rt2800-usb kmod-rt2x00-lib kmod-rt2x00-usb kmod-rt73-usb kmod-rtl8187 kmod-rtl8192c-common kmod-rtl8192ce kmod-rtl8192cu kmod-rtl8192de kmod-rtl8192se kmod-rtl8812au-ct kmod-rtl8821ae kmod-rtlwifi kmod-rtlwifi-btcoexist kmod-rtlwifi-pci kmod-rtlwifi-usb kmod-rtw88 kmod-sched kmod-sched-act-vlan kmod-sched-bpf kmod-sched-cake kmod-sched-connmark kmod-sched-core kmod-sched-ctinfo kmod-sched-flower kmod-sched-ipset kmod-sched-mqprio kmod-sfc kmod-sfc-falcon kmod-sfp kmod-sis190 kmod-sis900 kmod-sit kmod-skge kmod-sky2 kmod-sound-arm-bcm2835 kmod-ssb kmod-swconfig kmod-switch-bcm53xx kmod-switch-bcm53xx-mdio kmod-switch-ip17xx kmod-switch-rtl8306 kmod-switch-rtl8366-smi kmod-switch-rtl8366rb kmod-switch-rtl8366s kmod-switch-rtl8367b kmod-tcp-bbr kmod-tcp-hybla kmod-tg3 kmod-trelay kmod-tulip kmod-tun kmod-usb-acm kmod-usb-atm kmod-usb-atm-cxacru kmod-usb-atm-speedtouch kmod-usb-atm-ueagle kmod-usb-audio kmod-usb-cm109 kmod-usb-core kmod-usb-ehci kmod-usb-gadget kmod-usb-gadget-cdc-composite kmod-usb-gadget-eth kmod-usb-dwc2 kmod-usb-gadget-hid kmod-usb-gadget-mass-storage kmod-usb-gadget-serial kmod-usb-hid kmod-usb-hid-cp2112 kmod-usb-ledtrig-usbport kmod-usb-lib-composite kmod-usb-net kmod-usb-net-aqc111 kmod-usb-net-asix kmod-usb-net-asix-ax88179 kmod-usb-net-cdc-eem kmod-usb-net-cdc-ether kmod-usb-net-cdc-mbim kmod-usb-net-cdc-ncm kmod-usb-net-cdc-subset kmod-usb-net-dm9601-ether kmod-usb-net-hso kmod-usb-net-huawei-cdc-ncm kmod-usb-net-ipheth kmod-usb-net-kalmia kmod-usb-net-kaweth kmod-usb-net-mcs7830 kmod-usb-net-pegasus kmod-usb-net-pl kmod-usb-net-qmi-wwan kmod-usb-net-rndis kmod-usb-net-rtl8150 kmod-usb-net-rtl8152 kmod-usb-net-sierrawireless kmod-usb-net-smsc95xx kmod-usb-net-sr9700 kmod-usb-net2280 kmod-usb-ohci kmod-usb-ohci-pci kmod-usb-serial kmod-usb-serial-ark3116 kmod-usb-serial-belkin kmod-usb-serial-ch341 kmod-usb-serial-cp210x kmod-usb-serial-cypress-m8 kmod-usb-serial-edgeport kmod-usb-serial-ftdi kmod-usb-serial-ipw kmod-usb-serial-keyspan kmod-usb-serial-mct kmod-usb-serial-mos7720 kmod-usb-serial-mos7840 kmod-usb-serial-option kmod-usb-serial-oti6858 kmod-usb-serial-pl2303 kmod-usb-serial-qualcomm kmod-usb-serial-sierrawireless kmod-usb-serial-simple kmod-usb-serial-ti-usb kmod-usb-serial-visor kmod-usb-serial-wwan kmod-usb-storage kmod-usb-storage-extras kmod-usb-storage-uas kmod-usb-uhci kmod-usb-wdm kmod-usb-yealink kmod-usb2 kmod-usb2-pci kmod-usb3 kmod-usbip kmod-usbip-client kmod-usbip-server kmod-veth kmod-via-rhine kmod-via-velocity kmod-vmxnet3 kmod-vxlan kmod-wireguard kmod-xfrm-interface kmod-zram libatomic1 libattr libbfd libblkid1 libblobmsg-json libbpf0 libbz2-1.0 libc libcap libcap-bin libcomerr0 libctf libcurl4 libcurl libdbus libelf1 libertas-usb-firmware libevdev libevent2-7 libexpat libext2fs2 libf2fs6 libffi libgcc1 libgcrypt libgd libgmp10 libgnutls libgpg-error libimobiledevice libip4tc2 libip6tc2 libipset13 libiwinfo-data libiwinfo-lua libiwinfo libjpeg-turbo libjson-c5 libjson-script libkmod liblua5.1.5 liblucihttp-lua liblucihttp0 liblxc liblzma libmagic libmbim libmnl0 libncurses6 libnetfilter-conntrack3 libnettle8 libnfnetlink0 libnghttp2-14 libnl-tiny1 libopcodes libopenssl-conf libopenssl1.1 libpcap1 libpci libpcre libplist libpng libpthread libqmi libqrencode libqrtr-glib librt libseccomp libsensors5 libsmartcols1 libsqlite3-0 libss2 libstdcpp6 libsysfs2 libtasn1 libubox libubus-lua libubus libuci libuclient libudev-zero libusb-1.0-0 libusbmuxd libustream-wolfssl libuuid1 libuv1 libwebp libwebsockets-full libwolfssl libxml2 libxtables12 libzstd linux-atm logd lua luci luci-app-acl luci-app-firewall luci-app-lxc luci-app-opkg luci-app-speedifyconf luci-app-sqm luci-app-ttyd luci-app-vnstat2 luci-app-wifischedule luci-app-wol luci-base luci-compat luci-i18n-acl-ar luci-i18n-acl-cs luci-i18n-acl-de luci-i18n-acl-es luci-i18n-acl-fr luci-i18n-acl-pt luci-i18n-acl-ro luci-i18n-acl-ru luci-i18n-acl-tr luci-i18n-acl-zh-cn luci-i18n-base-ar luci-i18n-base-cs luci-i18n-base-de luci-i18n-base-es luci-i18n-base-fr luci-i18n-base-nl luci-i18n-base-pt luci-i18n-base-ro luci-i18n-base-ru luci-i18n-base-tr luci-i18n-base-zh-cn luci-i18n-firewall-ar luci-i18n-firewall-cs luci-i18n-firewall-de luci-i18n-firewall-es luci-i18n-firewall-fr luci-i18n-firewall-pt luci-i18n-firewall-ro luci-i18n-firewall-ru luci-i18n-firewall-tr luci-i18n-firewall-zh-cn luci-i18n-lxc-ar luci-i18n-lxc-cs luci-i18n-lxc-de luci-i18n-lxc-es luci-i18n-lxc-fr luci-i18n-lxc-pt luci-i18n-lxc-ro luci-i18n-lxc-ru luci-i18n-lxc-tr luci-i18n-lxc-zh-cn luci-i18n-opkg-ar luci-i18n-opkg-cs luci-i18n-opkg-de luci-i18n-opkg-es luci-i18n-opkg-fr luci-i18n-opkg-pt luci-i18n-opkg-ro luci-i18n-opkg-ru luci-i18n-opkg-tr luci-i18n-opkg-zh-cn luci-i18n-sqm-ar luci-i18n-sqm-cs luci-i18n-sqm-de luci-i18n-sqm-es luci-i18n-sqm-fr luci-i18n-sqm-pt luci-i18n-sqm-ro luci-i18n-sqm-ru luci-i18n-sqm-tr luci-i18n-sqm-zh-cn luci-i18n-ttyd-ar luci-i18n-ttyd-cs luci-i18n-ttyd-de luci-i18n-ttyd-es luci-i18n-ttyd-fr luci-i18n-ttyd-pt luci-i18n-ttyd-ro luci-i18n-ttyd-ru luci-i18n-ttyd-tr luci-i18n-ttyd-zh-cn luci-i18n-vnstat2-ar luci-i18n-vnstat2-cs luci-i18n-vnstat2-de luci-i18n-vnstat2-es luci-i18n-vnstat2-fr luci-i18n-vnstat2-pt luci-i18n-vnstat2-ro luci-i18n-vnstat2-ru luci-i18n-vnstat2-tr luci-i18n-vnstat2-zh-cn luci-i18n-wifischedule-ar luci-i18n-wifischedule-cs luci-i18n-wifischedule-de luci-i18n-wifischedule-es luci-i18n-wifischedule-fr luci-i18n-wifischedule-pt luci-i18n-wifischedule-ro luci-i18n-wifischedule-ru luci-i18n-wifischedule-tr luci-i18n-wifischedule-zh-cn luci-i18n-wireguard-ar luci-i18n-wireguard-cs luci-i18n-wireguard-de luci-i18n-wireguard-es luci-i18n-wireguard-fr luci-i18n-wireguard-pt luci-i18n-wireguard-ro luci-i18n-wireguard-ru luci-i18n-wireguard-tr luci-i18n-wireguard-zh-cn luci-i18n-wol-ar luci-i18n-wol-bg luci-i18n-wol-bn luci-i18n-wol-ca luci-i18n-wol-cs luci-i18n-wol-da luci-i18n-wol-de luci-i18n-wol-el luci-i18n-wol-en luci-i18n-wol-es luci-i18n-wol-fi luci-i18n-wol-fr luci-i18n-wol-he luci-i18n-wol-hi luci-i18n-wol-hu luci-i18n-wol-it luci-i18n-wol-ja luci-i18n-wol-ko luci-i18n-wol-mr luci-i18n-wol-ms luci-i18n-wol-no luci-i18n-wol-pl luci-i18n-wol-pt luci-i18n-wol-pt-br luci-i18n-wol-ro luci-i18n-wol-ru luci-i18n-wol-sk luci-i18n-wol-sv luci-i18n-wol-tr luci-i18n-wol-uk luci-i18n-wol-vi luci-i18n-wol-zh-cn luci-i18n-wol-zh-tw luci-lib-base luci-lib-ip luci-lib-jsonc luci-lib-nixio luci-mod-admin-full luci-mod-network luci-mod-status luci-mod-system luci-proto-3g luci-proto-gre luci-proto-hnet luci-proto-modemmanager luci-proto-ncm luci-proto-openconnect luci-proto-openfortivpn luci-proto-ppp luci-proto-qmi luci-proto-relay luci-proto-sstp luci-proto-vxlan luci-proto-wireguard luci-ssl-nginx luci-theme-bootstrap lxc lxc-attach lxc-common lxc-configs lxc-console lxc-create lxc-hooks lxc-templates mkf2fs modemmanager mt7601u-firmware mtd netifd nginx-mod-luci-ssl nginx-ssl nginx-ssl-util nginx-util nut objdump odhcp6c odhcpd-ipv6only openconnect openfortivpn openssl-util openwrt-keyring opkg p54-usb-firmware partx-utils pciids pciutils ppp ppp-mod-pppoa ppp-mod-pppoe ppp-mod-pptp ppp-mod-radius pppoe-discovery pppossh procd proto-bonding px5g-wolfssl qmi-utils qrencode r8169-firmware relayd resize2fs resolveip rpcd rpcd-mod-file rpcd-mod-iwinfo rpcd-mod-luci rpcd-mod-lxc rpcd-mod-rrdns rs9113-firmware rt2800-usb-firmware rt73-usb-firmware rtl8192ce-firmware rtl8192cu-firmware rtl8192de-firmware rtl8192se-firmware rtl8821ae-firmware socat speedifyconf sqm-scripts sstp-client sysfsutils tar tc-full tc-mod-iptables tc-tiny tcpdump terminfo ttyd tune2fs ubox ubus ubusd uci uclient-fetch uhttpd uhttpd-mod-ubus unzip uqmi urandom-seed usb-modeswitch usbids usbmuxd usbutils usign uwsgi uwsgi-cgi-plugin uwsgi-luci-support uwsgi-syslog-plugin vim-full vnstat2 vnstati2 vxlan wget-ssl whereis wifischedule wireguard-tools wireless-regdb wireless-tools wpad-basic-wolfssl wwan xz xz-utils zlib ethtool gnupg kmod-ikconfig cgroupfs-mount cgroup-tools liblxc luci-app-lxc lxc lxc-attach lxc-auto lxc-autostart lxc-cgroup lxc-checkconfig lxc-common lxc-config lxc-configs lxc-console lxc-copy lxc-create lxc-destroy lxc-device lxc-execute lxc-freeze lxc-hooks lxc-info lxc-init lxc-ls lxc-monitor lxc-monitord lxc-snapshot lxc-start lxc-stop lxc-templates lxc-top lxc-unfreeze lxc-unprivileged lxc-unshare lxc-user-nic lxc-usernsexec lxc-wait rpcd-mod-lxc piholeconf tailscaleconf luci-app-piholeconf luci-app-tailscaleconf rsync coreutils-tac nano kmod-i2c-bcm2835 luci-mod-battstatus vpn-policy-routing luci-app-vpn-policy-routing arp-scan arp-scan-database coreutils-stdbuf luci-app-statistics collectd-mod-uptime collectd-mod-sensors collectd-mod-ping collectd-mod-ethstat collectd-mod-wireless iptmon block-mount blockd luci-app-upnp kmod-crypto-acompress kmod-fs-autofs4 kmod-lib-lz4 kmod-lib-textsearch kmod-ipt-filter kmod-zram libblkid libcomerr libext2fs libss luci-app-engarde-easyconf luci-app-tinyfecvpn-easyconf tinyfecvpn-easyconf iptables-mod-filter engarde-easyconf e2fsprogs dmesg -dnsmasq"


