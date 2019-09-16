#!/bin/sh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    sudo apt install qemu
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
	brew install qemu
else
    exit 1
fi

export QEMU=$(which qemu-system-arm)
export TMP_DIR=~/tmp/qemu-rpi
export RPI_KERNEL_NAME=kernel-qemu-4.4.34-jessie
export RPI_KERNEL=${TMP_DIR}/${RPI_KERNEL_NAME}
export RPI_FS=${TMP_DIR}/2017-11-29-raspbian-stretch.img
# export PTB_FILE=${TMP_DIR}/versatile-pb.dtb
export IMAGE_FILE=2017-11-29-raspbian-stretch.zip
export IMAGE=http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-12-01/${IMAGE_FILE}
export SD_SIZE=16G

mkdir -p $TMP_DIR; cd $TMP_DIR

wget https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/${RPI_KERNEL_NAME}?raw=true \
	-O ${RPI_KERNEL}

# wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb \
# 	-O ${PTB_FILE}

wget $IMAGE
unzip $IMAGE_FILE

qemu-img resize ${RPI_FS} ${SD_SIZE}