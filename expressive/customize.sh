# override from default: up the MINAPI to Vanilla Ice Cream
MINAPI=35

REPLACE="
"

set_permissions() {
  :
}

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
