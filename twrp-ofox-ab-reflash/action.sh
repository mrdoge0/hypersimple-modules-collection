#!/system/bin/sh
TMPDIR="/data/adb/doge-hypersimple-twrpsurvive-tmp-$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 20 | head -n 1)"

# Create tmpdir
echo "Creating temporary dir ${TMPDIR}"
mkdir "${TMPDIR}"
