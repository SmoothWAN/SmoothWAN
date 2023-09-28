module("luci.controller.swanportfw.swanptfw", package.seeall)
  
local fs = require "nixio.fs"
local sys = require "luci.sys"
local template = require "luci.template"
local i18n = require "luci.i18n"


function index()
     local e = entry({"admin", "vpn", "swanptfw"}, cbi("swanportfw/swanptfw"), _("VPN Port Forward"), 90)
     e.acl_depends = { "luci-app-swanportfw" }
     e.dependent = false
     
end


