module("luci.controller.speedifyconf.spdconf", package.seeall)

local fs = require "nixio.fs"
local sys = require "luci.sys"
local template = require "luci.template"
local i18n = require "luci.i18n"


function index()
     local e = entry({"admin", "vpn", "spdconf"}, firstchild(), _("Speedify"), 60)
     e.acl_depends = { "luci-app-speedifyconf" }
     e.dependent = false
     
     entry({"admin", "vpn", "spdconf", "tab_from_cbi"}, cbi("speedifyconf/spdconf"), _("Config"), 1)
     entry({"admin", "vpn", "spdconf", "spdconf"}, call("spdconflog"), _("View Log"), 2)
end



function spdconflog()
    local logfile = fs.readfile("/tmp/log/speedifyconfig.log") or ""
    template.render("speedifyconf/file_viewer",
        {title = i18n.translate("Install/Service Script Log"), content = logfile})
end

