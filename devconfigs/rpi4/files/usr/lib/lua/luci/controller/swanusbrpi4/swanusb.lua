module("luci.controller.swanusbrpi4.swanusb", package.seeall)
  
local fs = require "nixio.fs"
local sys = require "luci.sys"
local template = require "luci.template"
local i18n = require "luci.i18n"


function index()
     local e = entry({"admin", "network", "swanusb"}, cbi("swanusbrpi4/swanusb), _("Multi-WAN USB"), 10)
     e.acl_depends = { "luci-app-swanusbrpi4" }
     e.dependent = false
     
end


