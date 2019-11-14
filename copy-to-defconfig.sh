#!/bin/bash

cp ./output/build/linux-custom/.config ./board/raspberrypi3/linux.config
cp ./output/build/busybox-1.31.0/.config ./board/raspberrypi3/busybox.config
cp ./.config ./board/raspberrypi3/buildroot.config

