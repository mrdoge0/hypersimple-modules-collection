MINAPI=23

REPLACE="
"

set_permissions() {
  :
}

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh

# override from default: check if the list exists
if [ ! -f '/data/adb/app_blacklist.txt' ]; then
  ui_print 'An app_blacklist.txt does not exist (probably new install or migration from APK Liberator)'
  ui_print 'Creating one out of the default'
  unzip -qjo "$ZIPFILE" 'app_blacklist.txt.default' -d '/data/adb' >&2
  mv '/data/adb/app_blacklist.txt.default' '/data/adb/app_blacklist.txt'
else
  ui_print 'An app_blacklist.txt already exists. Keeping the current one.'
fi
