#!/bin/sh

cp custom/config.txt output/images/rpi-firmware/
cp custom/cmdline.txt output/images/rpi-firmware/

mkdir -p output/images/overlays
cp output/build/linux-custom/arch/arm/boot/dts/overlays/*.dtbo output/images/overlays/

#echo $BR2_LINUX_KERNEL_INTREE_DTS_NAME
#for dtb in $BR2_LINUX_KERNEL_INTREE_DTS_NAME; do
#    cp output/build/linux-custom/arch/arm/boot/dts/$(dtb).dtb output/images/
#done

#FSTAB=`cat $TARGET_DIR/etc/fstab | grep /dev/sda1`
#if [ "$FSTAB" == "" ]; then
#    echo "/dev/sda1       /music          vfat    defaults        0       0" >>$TARGET_DIR/etc/fstab
#fi

cp output/build/linux-custom/arch/arm/boot/dts/bcm2710-rpi-3-b.dtb output/images/
cp output/build/linux-custom/arch/arm/boot/dts/bcm2710-rpi-3-b-plus.dtb output/images/
cp output/build/linux-custom/arch/arm/boot/dts/bcm2710-rpi-cm3.dtb output/images/

chmod 600 $TARGET_DIR/etc/ssh/*_key
chmod 600 $TARGET_DIR/etc/ssh/*_key.pub

chmod -x $TARGET_DIR/etc/init.d/S40xorg
#chmod -x $TARGET_DIR/etc/init.d/S20urandom
#chmod -x $TARGET_DIR/etc/init.d/S30dbus

if [ -e $TARGET_DIR/etc/init.d/S50sshd ]; then
    rm -f $TARGET_DIR/etc/init.d/S99sshd
    mv $TARGET_DIR/etc/init.d/S50sshd $TARGET_DIR/etc/init.d/S99sshd
fi

cp -a output/host/arm-buildroot-linux-gnueabihf/sysroot/lib/libatomic.so* $TARGET_DIR/lib/
cp -a output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so $TARGET_DIR/lib/
cp -a output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so.6 $TARGET_DIR/lib/
cp -a output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so.6.0.24 $TARGET_DIR/lib/

rm -f $TARGET_DIR/usr/lib/qt/plugins/audio/libqtaudio_alsa.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/audio/libqtmedia_pulse.so

rm -f $TARGET_DIR/usr/lib/qt/plugins/bearer/libqgenericbearer.so

rm -f $TARGET_DIR/usr/lib/qt/plugins//egldeviceintegrations/libqeglfs-emu-integration.so

rm -f $TARGET_DIR/usr/lib/qt/plugins/generic/libqevdevkeyboardplugin.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/generic/libqevdevmouseplugin.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/generic/libqevdevtouchplugin.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/generic/libqlibinputplugin.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/generic/libqtslibplugin.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/generic/libqtuiotouchplugin.so

rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqgif.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqicns.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqico.so
#rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqjpeg.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqtga.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqtiff.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqwbmp.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/imageformats/libqwebp.so

rm -f $TARGET_DIR/usr/lib/qt/plugins/mediaservice/libgstaudiodecoder.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/mediaservice/libgstcamerabin.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/mediaservice/libgstmediacapture.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/mediaservice/libgstmediaplayer.so

rm -f $TARGET_DIR/usr/lib/qt/plugins/platforms/libqlinuxfb.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/platforms/libqminimal.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/platforms/libqminimalegl.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/platforms/libqoffscreen.so
rm -f $TARGET_DIR/usr/lib/qt/plugins/platforms/libqvnc.so

rm -f $TARGET_DIR/usr/lib/qt/plugins/playlistformats/libqtmultimedia_m3u.so
