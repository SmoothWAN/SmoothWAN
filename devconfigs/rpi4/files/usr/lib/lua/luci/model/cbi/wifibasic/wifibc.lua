m = Map("wireless", "Automated Wi-Fi Access Point Configuration" )


s = m:section(TypedSection, "wifi-iface", "Detected Wi-Fi hardware", "- The use of the integrated Wi-Fi on   the Raspberry Pi 4 is discouraged due to instability and performance issues.<br>- USB Wi-Fi adapters are not reliable in Access Point mode.<br>- USB Wi-Fi adapter automatic detection/setup may not work with all        models, go to main Wireless tab for advanced configuration.<br>- It is recommended to use an external Wi-Fi  access point or a router combo via Ethernet for high reliability and speed.")

ap = s:option(Value, "ssid", "Access Point Name:")
ap.rmempty = false
ap.optional = false
pass = s:option(Value, "key", "Access Point Password:")
pass.password = true
pass.rmempty = false
pass.optional = false

l = m:section(TypedSection, "wifi-device")
l.anonymous = true
disabled = l:option(Flag, "disabled", "Turn Off")
channel = l:option(ListValue, "channel", "Channel")
channel:value("auto",auto)
channel:value(1,1)
channel:value(2,2)
channel:value(3,3)
channel:value(4,4)
channel:value(5,5)
channel:value(6,6)
channel:value(7,7)
channel:value(8,8)
channel:value(9,9)
channel:value(10,10)
channel:value(11,11)

return m

