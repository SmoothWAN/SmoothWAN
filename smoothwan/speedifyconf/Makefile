
include $(TOPDIR)/rules.mk

PKG_NAME:=speedifyconf
PKG_VERSION:=1
PKG_RELEASE:=3

PKG_MAINTAINER:=TALMASH

include $(INCLUDE_DIR)/package.mk

define Package/speedifyconf
  SUBMENU:=VPN
  TITLE:=Speedify setup and configuration
  SECTION:=net
  CATEGORY:=Network
  PKGARCH:=all
endef

define Package/speedifyconf/description
Install and configure Speedify from LuCI/WebUI.
endef

define Package/speedifyconf/conffiles
/etc/config/speedifyconf
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/speedifyconf/install
	$(INSTALL_DIR) $(1)/usr/lib/speedifyconf
	$(INSTALL_BIN) ./net/usr/lib/speedifyconf/run.sh $(1)/usr/lib/speedifyconf/run.sh
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./net/etc/config/speedifyconf $(1)/etc/config/speedifyconf
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DATA) ./net/etc/init.d/speedifyconf $(1)/etc/init.d/speedifyconf
endef

$(eval $(call BuildPackage,speedifyconf))
