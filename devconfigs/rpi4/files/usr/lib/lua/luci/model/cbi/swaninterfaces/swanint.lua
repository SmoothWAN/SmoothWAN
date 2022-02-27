local wa = require "luci.tools.webadmin"
local net = require "luci.model.network".init()
local sys = require "luci.sys"
local ifaces = sys.net:devices()

m = Map("network", translate("Multi-WAN Basic Setup"))

s = m:section(TypedSection, "interface", "Configured WANs", "<b>Guide:</b><br>• All network equipments own a unique address or identifier known as MAC (media access control).<br>• Check the back of the connected medium (USB ethernet, modem etc) for MAC address for the purpose of identification.<br>• Enter a friendly name containing no more than 10 characters consisting of numbers and/or letters in the text field<br>near the 'Add' button below for each unconfigured WAN.<br>• The name will be shown in Speedify interface dialogs as is and data caps/metering/settings are persistent.<br><b>Notes:</b><br>• Disable MAC randomization(privacy settings) on iOS/Android when tethering via USB.<br>• NCM and old cellular modems are unsupported and discouraged from use.")

s.addremove = true

function s:filter(value)
        return value ~= "lan" and value ~= "loopback" and value ~= "Speedify"
end

n = s:option(ListValue, "usemac", translate("Interface by MAC address:"))

-- ugly code ahead, filter with array doesnt work well with '-'
for _, e in ipairs(sys.net.devices()) do
	if e ~= "eth0" 
	and e ~= "lo" 
	and e ~= "br-lan"
	and e ~= "ip6tnl0"
	and e ~= "tunl0"
	and e ~= "sit0"
	and e ~= "gre0"
	and e ~= "gretap0"
	and e ~= "erspan0"
	and e ~= "ip6gre0"
	and e ~= "bond0"
	and e ~= "teql0"
	and e ~= "wlan0"
	and e ~= "br-wifiinternal"
	then
	e = luci.ip.link(e).mac 
	n:value(e)
	else e = nil
	end
end

p = s:option(ListValue, "proto", "Protocol:")
p:value("dhcp", "DHCP")
p:value("static", "Static")

s:option(Value, "ipaddr", translate("IP Address:")):depends("proto", "static")
nm = s:option(Value, "netmask", translate("Netmask:"))
nm:depends("proto", "static")
nm.default = '255.255.255.0'
s:option(Value, "gateway", translate("Gateway:")):depends("proto", "static")

mtt = s:option(Value, "metric", translate("Bypass priority:"), translate("If Speedify is down or disabled, the WAN with the lower number will be used, set all WANs to the same number for no particular order. Number starts at 10."))
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

