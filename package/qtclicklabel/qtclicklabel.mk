################################################################################
#
# QtClickLabel
#
################################################################################
QTCLICKLABEL_VERSION = master
QTCLICKLABEL_SITE = $(call github,jb1nbg,qtclicklabel,$(QTCLICKLABEL_VERSION))
QTCLICKLABEL_DEPENDENCIES += qt5base
QTCLICKLABEL_INSTALL_STAGING = YES

define QTCLICKLABEL_CONFIGURE_CMDS
    (cd $(@D); $(QT5_QMAKE) QClickLabel.pro)
endef

define QTCLICKLABEL_BUILD_CMDS
    $(MAKE) -C $(@D)
endef

define QTCLICKLABEL_INSTALL_STAGING_CMDS
    $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
endef

define QTCLICKLABEL_INSTALL_TARGET_CMDS
    $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)
endef

$(eval $(generic-package))
