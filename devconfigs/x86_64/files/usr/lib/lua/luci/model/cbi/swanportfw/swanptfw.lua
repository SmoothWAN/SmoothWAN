local wa = require "luci.tools.webadmin"
local net = require "luci.model.network".init()
local sys = require "luci.sys"
local ifaces = sys.net:devices()

m = Map("firewall", translate("VPN Basic Port Forwarding"))

s = m:section(TypedSection, "redirect", "Speedify Port Forwarding", "- Applies to Speedify dedicated plan only. (Forwards UDP and TCP)<br>- Add the same source and destination ports in Speedify afterwards.")

s.addremove = true

p = s:option(ListValue, "target", "Type:")
p:value("DNAT", "DNAT")
p:value("static", "SNAT")

l = s:option(ListValue, "src", "Zone Source:")
l:value("wan", "wan")
l:value("lan", "lan")

s:option(Value, "src_dport", "Source Port:")

d = s:option(ListValue, "dest", "Zone Desitnation:")
d:value("lan", "lan")
d:value("wan", "wan")

s:option(Value, "dest_ip", "Destination IP:", "Client IP address on LAN.<br>Note: Set client to static IP address first.")
s:option(Value, "dest_port", "Destination Port:")

return m
