# SPDX-License-Identifier: GPL-2.0-only
#
# Makefile for the RFUSE filesystem (rfuse.ko).
#
# rfuse.ko can be loaded alongside the in-tree fuse.ko: it registers the
# filesystem types "rfuse"/"rfuseblk", the device /dev/rfuse, the control
# filesystem "rfusectl" and the sysfs dir /sys/fs/rfuse, and exports no
# symbols.
#
# KDIR defaults to the running kernel's build tree.

# Uncomment below line to compile with debug option
# ccflags-y += -DDEBUG

# RFUSE keeps many non-static helpers without prototypes
ccflags-y += -Wno-missing-prototypes -Wno-missing-declarations

obj-m += rfuse.o

rfuse-y := dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o ioctl.o \
	   rfuse_dev.o rfuse_dir.o rfuse_inode.o rfuse_file.o rfuse_comp.o

KDIR ?= /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KDIR) M=$(CURDIR) modules

clean:
	$(MAKE) -C $(KDIR) M=$(CURDIR) clean

# Installs rfuse.ko under /lib/modules/<version>/updates so that
# "modprobe rfuse" works (run with sudo, then depmod -a)
install:
	$(MAKE) -C $(KDIR) M=$(CURDIR) modules_install
