config = Map("speedifyconf") 

view = config:section(NamedSection,"Setup", "config",  translate("Speedify Configuration"), translate("Check the log tab for installation or service status."))
apt = view:option(Value, "apt", "Repository URL:", "Hint: http://apt.connectify.me/ as of late year 2021."); view.optional=false; view.rmempty = false;
auto = view:option(Flag, "autoupdate", "Update on boot:", "Updates Speedify before starting."); view.optional=false; view.rmempty = false;
upd = view:option(Button, "_update", "Install/Update now", "Also forces re-installation, keeping data. Use this for first time installation.")
rst = view:option(Button, "_reset", "Reset Speedify", "Deletes 'logs' folder and restarts Speedify.")

function upd.write()
  luci.sys.call("sh /usr/lib/speedifyconf/run.sh update > /tmp/log/speedifyconfig.log &")
end

function rst.write()
  luci.sys.call("rm -rf /usr/share/speedify/logs && sh /usr/lib/speedifyconf/run.sh > /tmp/log/speedifyconfig.log &")
end

return config

