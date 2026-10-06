#!/bin/bash
# (Re)load rfuse.ko.  It registers "rfuse"/"rfuseblk", /dev/rfuse and
# "rfusectl", so it can be loaded while fuse.ko is loaded.

if [ "$1" != "first" ]
then
	if grep -qw /sys/fs/rfuse/connections /proc/mounts; then
		sudo umount /sys/fs/rfuse/connections
	fi
	sudo rmmod rfuse
fi
sudo insmod rfuse.ko
echo done
