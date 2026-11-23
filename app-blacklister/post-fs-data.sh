#!/system/bin/sh

# If a blacklist does not exist.
[ -f '/data/adb/app_blacklist.txt' ] || cp "${0%/*}/app_blacklist.txt.default" '/data/adb/app_blacklist.txt'

# That's it for the required post-fs-data function.
