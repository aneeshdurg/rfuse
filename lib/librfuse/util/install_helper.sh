#!/bin/sh
#
# Don't call this script. It is used internally by the Meson
# build system. Thank you for your cooperation.
#

set -e

sysconfdir="$1"
bindir="$2"
udevrulesdir="$3"
useroot="$4"

# Both sysconfdir and bindir are absolute paths (since they are joined
# with --prefix in meson.build), but need to be interpreted relative
# to DESTDIR (if specified).

if [ -z "${DESTDIR}" ]; then
    # Prevent warnings about uninitialized variable
    DESTDIR=""
else
    # Get rid of duplicate slash
    DESTDIR="${DESTDIR%/}"
fi

install -D -m 644 "${MESON_SOURCE_ROOT}/util/fuse.conf" \
	"${DESTDIR}${sysconfdir}/rfuse.conf"

if $useroot; then
    chown root:root "${DESTDIR}${bindir}/rfusermount3"
    chmod u+s "${DESTDIR}${bindir}/rfusermount3"
    # /dev/rfuse has a dynamic minor; it is created by devtmpfs/udev when
    # rfuse.ko is loaded.
fi

install -D -m 644 "${MESON_SOURCE_ROOT}/util/udev.rules" \
        "${DESTDIR}${udevrulesdir}/99-rfuse3.rules"

install -D -m 755 "${MESON_SOURCE_ROOT}/util/init_script" \
        "${DESTDIR}/etc/init.d/rfuse3"


if test -x /usr/sbin/update-rc.d && test -z "${DESTDIR}"; then
    /usr/sbin/update-rc.d rfuse3 start 34 S . start 41 0 6 . || /bin/true
else
    echo "== FURTHER ACTION REQUIRED =="
    echo "Make sure that your init system will start the ${DESTDIR}/etc/init.d/rfuse3 init script"
fi


