# PKG selects the library: rfuse3 (librfuse, default) or fuse3 (stock libfuse)
PKG ?= rfuse3

all: StackFS_ll

StackFS_ll:
	gcc -Wall StackFS_LowLevel.c `pkg-config $(PKG) --cflags --libs` -o StackFS_ll

clean:
	rm -rf StackFS_ll
