module("luci.controller.swanmacaddr.swanmac", package.seeall)
  
local fs = require "nixio.fs"
local sys = require "luci.sys"
local template = require "luci.template"
local i18n = require "luci.i18n"


function index()
     local e = entry({"admin", "network", "swanmac"}, cbi("swanmacaddr/swanmac"), _("Multi-WAN MAC"), 10)
     e.acl_depends = { "luci-app-swanmacaddr" }
     e.dependent = false
     
end


