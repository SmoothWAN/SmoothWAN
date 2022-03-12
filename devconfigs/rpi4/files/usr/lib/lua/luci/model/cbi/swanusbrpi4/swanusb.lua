local wa = require "luci.tools.webadmin"
local net = require "luci.model.network".init()
local sys = require "luci.sys"
local ifaces = sys.net:devices()

m = Map("network", translate("Multi-WAN USB Setup"), translate("• Note: Empty the names to use 'Multi-WAN MAC'<br> <img src='\\luci-static/bootstrap/mwanusb.svg' width = 400>"))

s = m:section(TypedSection, "interface", "USB Ports")

s.addremove = false

function s:filter(value)
     return value == "One" or value == "Two" or value == "Three" or value == "Four"
end

n = s:option( Value, "usename", translate("Name in Speedify:"), translate("Up to 10 characters containing numbers, letters and '-' only"))

n.write = function(self, section, value)
        self.map:set(section, "device", value)
        return Value.write(self, section, value)
end

p = s:option(ListValue, "proto", "Protocol:")
p:value("dhcp", "DHCP")
p:value("static", "Static")

s:option(Value, "ipaddr", translate("IP Address:")):depends("proto", "static")
nm = s:option(Value, "netmask", translate("Netmask:"))
nm:depends("proto", "static")
nm.default = '255.255.255.0'
s:option(Value, "gateway", translate("Gateway:")):depends("proto", "static")

mtt = s:option(Value, "metric", translate("Bypass priority:"), translate("The WAN with the lowest number will be used when Speedify is disconnected."))
mtt.default = '10'

return m
