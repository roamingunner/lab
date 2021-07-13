#!/bin/bash
# there isn't python in rootfs
qemu-system-arm -machine vexpress-a9 -dtb vexpress-v2p-ca9.dtb -kernel zImage -sd rootfs.ext2  -append "root=/dev/mmcblk0 rw console=ttyAMA0" --nographic -fsdev local,security_model=passthrough,id=fsdev0,path=`pwd`/share -device virtio-9p-device,fsdev=fsdev0,mount_tag=hostshare -net nic -net tap,ifname=tap0

# rootfs include python3
# qemu-system-arm -machine vexpress-a9 -dtb vexpress-v2p-ca9.dtb -kernel zImage -sd rootfs_with_python3.ext2  -append "root=/dev/mmcblk0 rw console=ttyAMA0" --nographic -fsdev local,security_model=passthrough,id=fsdev0,path=`pwd`/share -device virtio-9p-device,fsdev=fsdev0,mount_tag=hostshare -net nic -net tap,ifname=tap0
