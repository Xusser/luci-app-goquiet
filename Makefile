include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-goquiet
PKG_VERSION=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-goquiet
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=GoQuiet Client for LuCI
	PKGARCH:=all
endef

define Package/luci-app-goquiet/description
	This package contains LuCI configuration pages for goquiet.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-goquiet/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	
	$(INSTALL_CONF) ./files/root/etc/config/goquiet $(1)/etc/config/goquiet
	$(INSTALL_BIN) ./files/root/etc/init.d/goquiet $(1)/etc/init.d/goquiet
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/model/cbi/goquiet.lua $(1)/usr/lib/lua/luci/model/cbi/goquiet.lua
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/controller/goquiet.lua $(1)/usr/lib/lua/luci/controller/goquiet.lua
endef

$(eval $(call BuildPackage,luci-app-goquiet))
