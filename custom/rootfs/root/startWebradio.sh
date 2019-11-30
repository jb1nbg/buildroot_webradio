#!/bin/sh

#export QT_QPA_PLATFORM=linuxfb:fb=/dev/fb1
export QT_QPA_PLATFORM=eglfs
#export QT_LOGGING_RULES=qt.qpa.input=true
#export QT_QPA_GENERIC_PLUGINS=evdevtablet:/dev/input/touchscreen
export QT_QPA_FONTDIR=/usr/share/fonts/liberation/

export QT_QPA_EGLFS_HIDECURSOR=1
export QT_QPA_EGLFS_WIDTH=480
export QT_QPA_EGLFS_HEIGHT=320
export QT_QPA_EGLFS_PHYSICAL_WIDTH=71
export QT_QPA_EGLFS_PHYSICAL_HEIGHT=50
#export QT_QPA_EGLFS_DEPTH=16

/usr/bin/Webradio
