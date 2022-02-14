local wa = require "luci.tools.webadmin"
local net = require "luci.model.network".init()
local sys = require "luci.sys"
local ifaces = sys.net:devices()

m = Map("network", translate("Multi-WAN Basic Setup"))

s = m:section(TypedSection, "interface", "Configured WANs", "All network equipments own a unique address or identifier known as MAC (media access control).<br>Check the back of the connected medium (USB ethernet, modem etc) for MAC address for the purpose of identification.<br>The last 6 digits of the full address are detected and listed as newdev-{last 6 digits} below.<br>Enter a friendly name containing no more than 10 characters consisting of numbers and letters in the text field<br>near the 'Add' button below for each WAN you want to configure.<br>The name will be shown in Speedify interface dialogs as is and data caps/metering/settings are persistent.")

s.addremove = true

function s:filter(value)
	return value ~= "lan" and value ~= "loopback" and value ~= "Speedify"
end

n = s:option(ListValue, "origindev", translate("Unassigned interface to use:"), translate("Only new or unassigned devices are listed.<br>A succesful configration will show a different unassigned interface or blank on apply/refresh.<br>Interface name will be changed to WAN name from newdev-*mac*<br>To change interface, delete this WAN entry, replug the WAN interface else reboot, and start over by adding a new WAN."))

for _, iface in ipairs(ifaces) do
	if      (iface:match("^newdev*")) then
		local nets = net:get_interface(iface)
		nets = nets and nets:get_networks() or {}
		for k, v in pairs(nets) do
			nets[k] = nets[k].sid
		end
		nets = table.concat(nets, ",")
		n:value(iface, ((#nets > 0) and "%s (%s)" % {iface, nets} or iface))
	end
end
n.rmempty = false

p = s:option(ListValue, "proto", "Protocol:")
p:value("dhcp", "DHCP")
p:value("static", "Static")

s:option(Value, "ipaddr", translate("IP Address:")):depends("proto", "static")
nm = s:option(Value, "netmask", translate("Netmask:"))
nm:depends("proto", "static")
nm.default = '255.255.255.0'
s:option(Value, "gateway", translate("Gateway:")):depends("proto", "static")

mtt = s:option(Value, "metric", translate("Bypass priority:"), translate("Optional. Default value disables priority. The lower the number the higher the priority.<br>If Speedify is down or disabled, the WAN with the lower number will be used.<br>'VPN Bypass' app follows the same rule."))
mtt.default = '10'

function s.remove(self, sid)
	luci.sys.call(string.format("uci del_list firewall.cfg03dc81.network='%s'", sid))
	return TypedSection.remove(self, sid)
end

function s.create(self, sid)
	luci.sys.call(string.format("uci add_list firewall.cfg03dc81.network='%s'", sid))
	return TypedSection.create(self, sid)
end


return m
