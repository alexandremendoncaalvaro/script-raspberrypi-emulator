#!/bin/bash

export QEMU=$(which qemu-system-arm)
export TMP_DIR=~/tmp/qemu-rpi
export RPI_KERNEL=${TMP_DIR}/kernel-qemu-4.4.34-jessie
export RPI_FS=${TMP_DIR}/2017-11-29-raspbian-stretch.img

$QEMU -kernel ${RPI_KERNEL} \
	-cpu arm1176 -m 256 -M versatilepb \
	-serial stdio -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
	-drive "file=${RPI_FS},index=0,media=disk,format=raw" \
	-net user,hostfwd=tcp::5022-:22 -net nic