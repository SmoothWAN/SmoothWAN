local wa = require "luci.tools.webadmin"
local net = require "luci.model.network".init()
local sys = require "luci.sys"
local ifaces = sys.net:devices()

m = Map("network", translate("Multi-WAN USB Setup"), translate("• Note: Enter empty name to all ports to use 'Multi-WAN MAC'<br> <img src='\\luci-static/bootstrap/mwanusb.svg' width = 400>"))

s = m:section(TypedSection, "interface", "USB Ports")

s.addremove = false

function s:filter(value)
     return value == "One" or value == "Two" or value == "Three" or value == "Four"
end

n = s:option(Value, "usename", translate("Name in Speedify:"), translate("Enter no more than 10 characters containing numbers, letters and '-' only"))

p = s:option(ListValue, "proto", "Protocol:")
p:value("dhcp", "DHCP")
p:value("static", "Static")
p:value("ncm", "NCM")

s:option(Value, "ipaddr", translate("IP Address:")):depends("proto", "static")
nm = s:option(Value, "netmask", translate("Netmask:"))
nm:depends("proto", "static")
nm.default = '255.255.255.0'
s:option(Value, "gateway", translate("Gateway:")):depends("proto", "static")

cm = s:option(Value, "device", translate("NCM Device:"), translate("'/dev/cdc-wdm0' is commonly used. Increment the last number if more than one NCM device is used."))
cm:depends("proto", "ncm")
cm.default = '/dev/cdc-wdm0'

cmsvc = s:option(ListValue, "service", translate("Service Type:"))
cmsvc:depends("proto", "ncm")
cmsvc:value("preferlte","Prefer LTE")
cmsvc:value("preferumts","Prefer UMTS")
cmsvc:value("lte","LTE only")
cmsvc:value("umts","UMTS/GPRS")
cmsvc:value("gsm","GPRS only")
cmsvc:value("auto","Automatic")

pdptyp = s:option(ListValue, "pdptype", translate("IP Protocol:"))
pdptyp:depends("proto","ncm")
pdptyp:value("IP","IPv4")
pdptyp:value("IPV4V6","IPv4+IPv6")
pdptyp:value("IPV6","IPv6")

apn = s:option(Value, "apn", translate("APN:"))
apn:depends("proto","ncm")

pincod = s:option(Value, "pincode", translate("Pin code:"))
pincod:depends("proto","ncm")

usernam = s:option(Value, "username", translate("Username:"))
usernam:depends("proto","ncm")

passw = s:option(Value, "password", translate("Passowrd:"))
passw:depends("proto","ncm")
passw.password = true

dialno = s:option(Value, "dialnumber", translate("Dial Number:"))
dialno:depends("proto","ncm")

mtt = s:option(Value, "metric", translate("Bypass priority:"), translate("If Speedify is down or disabled, the WAN with the lower number will be used, set all WANs to the same number for no particular order. Number starts at 10"))
mtt.default = '10'

return m

