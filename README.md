### These are two files to help create a new Debian Bookworm preseed file and write it to a USB thumbdrive for installation.  This is tested using legacy BIOS and not GPT drives for ...reasons.

1. Section B.4.1 - Modify this for your locale.
2. Section B.4.2 - If you want to enable network configuration, start here.
3. Section B.4.3 - Put in your IP, subnet, etc., here.
4. Sectopm B.4.4 - Setup your mirrors here.
5. Section B.4.5 - Set your root password and new user/password here.
6. Section B.4.6 - Set your timezone info here.
7. Section B.4.7 - Be sure to create a backup of this file before messing with this section.  This is where things get complicated.  Specify your drive(s) here.


For everything under B.4.7, everything should be good other than grub.  You'll need to specify the device you used in B.4.7 for the grub-install.  After that, you should select your base GUI software in the tasksel section, if you need it.
