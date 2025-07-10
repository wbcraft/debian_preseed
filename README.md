### These are two files to help create a new Debian Bookworm preseed file and write it to a USB thumbdrive for installation.  This is tested using legacy BIOS and not GPT drives because ...reasons.

### debian.preseed
1. Section B.4.1 - Modify this for your locale.
2. Section B.4.2 - If you want to enable network configuration, start here.
3. Section B.4.3 - Put in your IP, subnet, etc., here.
4. Section B.4.4 - Setup your mirrors here.
5. Section B.4.5 - Set your root password and new user/password here.
6. Section B.4.6 - Set your timezone info here.
7. Section B.4.7 - Be sure to create a backup of this file before messing with this section.  This is where things get complicated.  Specify your drive(s) here.


For things under B.4.7, everything should be good other than grub.  You'll need to specify the device you used in B.4.7 for the grub-install.  After that, you should select your base GUI software in the tasksel section, if you need it.

Feel free to modify the file system sizes as you see fit, but backup the file first.  If you're modifying the LVM layout, remember to end on a period.

I will not be doing a GPT version.


### Create the USB thumbdrive - create_iso.sh

1. I believe it's required to run this as root.. maybe not. 
2. Save this file and make it executable:  chmod 755 create_iso.sh
3. Run `./create_iso.sh`
4. It will install the genisoimage and syslinux-utils packages for later in the script
5. It also makes a /storage directory and chmod's it.  You can change this to whatever you wish, but you may need to modify things elsewhere.
6. Make sure you have whichever Debian iso downloaded.  Modify lines 7 and 10 to include the name of that iso.  This assumes you've kept the debian.preseed and iso files in the same directory (for the copy to /storage).
7. On line 32 you'll need to specify the USB thumbdrive you wish to use.  I recommend the command `lsblk` to figure that out.
8. Once done, pop the usb into the computer you want to build, go to advanced installation, and do the automatic install.
