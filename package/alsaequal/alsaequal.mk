################################################################################
#
# alsaequal
#
################################################################################
ALSAEQUAL_VERSION = 0.6
ALSAEQUAL_FILE = alsaequal_$(ALSAEQUAL_VERSION).orig.tar
ALSAEQUAL_SITE = http://deb.debian.org/debian/pool/main/a/alsaequal/$(ALSAEQUAL_FILE).bz2
ALSAEQUAL_SITE_METHOD = http
ALSAEQUAL_AUTORECONF = YES
ALSAEQUAL_CONF_OPTS = --libdir=/usr/lib/alsa-lib/
ALSAEQUAL_LICENSE_FILES = COPYING
ALSAEQUAL_DEPENDENCIES = alsa-lib
ALSAEQUAL_TEMP_FOLDER = .alsaequal_$(ALSAEQUAL_VERSION)

define ALSAEQUAL_PRE_DOWNLOAD
    rm -rf $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)
    mkdir $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)
    $(WGET) $(ALSAEQUAL_SITE) -P $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)
    bzip2 -d $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)/$(ALSAEQUAL_FILE).bz2
    gzip $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)/$(ALSAEQUAL_FILE)
    mkdir -p $(DL_DIR)/alsaequal
    mv $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)/$(ALSAEQUAL_FILE).gz $(DL_DIR)/alsaequal/alsaequal-$(ALSAEQUAL_VERSION).tar.gz
    rm -rf $(DL_DIR)/$(ALSAEQUAL_TEMP_FOLDER)
endef

ALSAEQUAL_PRE_DOWNLOAD_HOOKS += ALSAEQUAL_PRE_DOWNLOAD

$(eval $(autotools-package))
