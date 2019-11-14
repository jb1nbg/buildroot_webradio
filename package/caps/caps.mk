################################################################################
#
# caps
#
################################################################################

CAPS_VERSION = 0.9.26
CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
CAPS_SITE = http://quitte.de/dsp
CAPS_LICENSE = GPLv3
CAPS_LICENSE_FILES = COPYING

define CAPS_BUILD_CMDS
 $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 all -C $(@D)
endef

define CAPS_INSTALL_TARGET_CMDS
 $(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
 DESTDIR=$(TARGET_DIR) install -C $(@D)
endef

$(eval $(generic-package))
