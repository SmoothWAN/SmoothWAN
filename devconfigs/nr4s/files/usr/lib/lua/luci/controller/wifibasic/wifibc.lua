module("luci.controller.wifibasic.wifibc", package.seeall)

  local fs = require "nixio.fs"
  local sys = require "luci.sys"
  local template = require "luci.template"
  local i18n = require "luci.i18n"


function index()
     local e = entry({"admin", "network", "wifibc"}, cbi("wifibasic/wifibc"), _("Wireless (Basic)"), 10)
          e.acl_depends = { "luci-app-wifibasic" }
          e.dependent = false
end
