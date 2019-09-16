# QEMU Raspbian (Raspberry Pi Emulator) #

Script to install, config and run QEMU emulator for Raspberry Pi 3

# IMPORTANT #
QEMU doesn't work well with all Raspbian versions. Raspbian Stretch(2017-11-29) is tested and known to work.

This script works for Mac OS and Linux.
For Windows, please use: http://www.rpi-emulator.com/

## Install ##
To install use:
```bash
chmod +x *.sh && ./rpi-install-full.sh
```
After install, to run use:
```bash
./rpi-start.sh
```

## Raspbian config ##
On the first use you'll need to configure the partitions

```bash
sudo fdisk /dev/sda
```

Display the partitions using the **p** command.

Take note of the beginning of the second partition block. For exemple, my value was 125904.
Delete the second partition with the **d** command then **2**.
If you again display the partitions it has disappeared.

Create a new partition with **n** then **p** then **2**. There fdisk provides a value for the starting block (the value that you have identified earlier). The following value is the end block that is the largest possible to fill all the space.
If you display the information again you will see that your new partition has a end higher so that means that the partition is larger.

Back up the information with **w** command.
Restart the machine.

Verify current filesytem size:
```bash
df -h
```
Now resize the filesytem:
```bash
sudo resize2fs /dev/sda
```
Verify if it works:
```bash
df -h
```

# Are you a native english speaker?
No, I am not. If you find typos, grammar errors or whatever please feel free to PR or tell me.