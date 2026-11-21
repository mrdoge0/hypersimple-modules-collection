#!/system/bin/sh
MODDIR=${0%/*}

# If a blacklist does not exist.
[ -f '/data/adb/app_blacklist.txt' ] || cp "${MODDIR}/app_blacklist.txt.default" '/data/adb/app_blacklist.txt'

# That's it for the required post-fs-data function.
