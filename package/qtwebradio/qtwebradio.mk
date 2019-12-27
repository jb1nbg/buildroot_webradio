################################################################################
#
# QtWebradio
#
################################################################################
QTWEBRADIO_VERSION = master
QTWEBRADIO_SITE = $(call github,jb1nbg,qtwebradio,$(QTWEBRADIO_VERSION))
QTWEBRADIO_DEPENDENCIES += qt5base

define QTWEBRADIO_CONFIGURE_CMDS
    (cd $(@D); sed -i 's#/usr/include/#$(STAGING_DIR)/usr/include/#g' Webradio.pro; sed -i 's#-lqclicklabel#-L$(STAGING_DIR)/usr/lib -lqclicklabel#' Webradio.pro; $(QT5_QMAKE)  Webradio.pro)
endef

define QTWEBRADIO_BUILD_CMDS
    $(MAKE) -C $(@D)
endef

define QTWEBRADIO_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
endef

$(eval $(generic-package))
