#!/bin/bash
# Build and install librfuse (librfuse3.so, pkg-config "rfuse3", headers in
# <prefix>/include/rfuse3, rfusermount3, mount.rfuse3).  None of these names
# overlap with the system's libfuse3, so both can be installed side by side.

set -e
rm -rf build
meson setup build
ninja -C build
sudo ninja -C build install
