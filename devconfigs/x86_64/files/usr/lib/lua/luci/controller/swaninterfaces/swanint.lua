module("luci.controller.swaninterfaces.swanint", package.seeall)
  
local fs = require "nixio.fs"
local sys = require "luci.sys"
local template = require "luci.template"
local i18n = require "luci.i18n"


function index()
     local e = entry({"admin", "network", "swanint"}, cbi("swaninterfaces/swanint"), _("Multi-WAN Interfaces"), 10)
     e.acl_depends = { "luci-app-swaninterfaces" }
     e.dependent = false
     
end


