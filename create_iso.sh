#!/bin/bash
# Run this as root
# Required files:
# genisoimage syslinux-utils
apt-get install genisoimage syslinux-utils
mkdir /storage && chmod 777 /storage
cp debian-12.9.0-amd64-DVD-1.iso debian.preseed /storage
cd /storage

# Add preseed file to initrd
7z x -oisofiles debian-12.9.0-amd64-DVD-1.iso # or pick your own ISO.
chmod +w -R isofiles/install.*
gunzip isofiles/install.*/initrd.gz
echo preseed.cfg | cpio -H newc -o -A -F isofiles/install.*/initrd
gzip isofiles/install.*/initrd
cp preseed.cfg isofiles/install.amd/preseed.cfg
cp preseed.cfg isofiles/install.amd/preseed.txt
cp preseed.cfg isofiles/preseed.cfg
cp preseed.cfg isofiles/preseed.txt
chmod -w -R isofiles/install.*

# Regenerate the md5sum
cd isofiles
chmod +w md5sum.txt
find -follow -type f ! -name md5sum.txt -print0 | xargs -0 md5sum > md5sum.txt
chmod -w md5sum.txt
cd ..

# Create bootable ISO image
# You'll need to do lsblk and/or lsusb to determine the name of your USB storage device.
genisoimage -r -J -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o preseed.debian.iso isofiles
isohybrid preseed.debian.iso
cp preseed.debian.iso /dev/sdh 

# Remove unnecessary files
chmod +w -R isofiles
rm -rf isofiles /storage/preseed.debian.iso
