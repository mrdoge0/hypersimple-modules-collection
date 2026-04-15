MINAPI=23
MAXAPI=37

REPLACE="
"

set_permissions() {
  :
}

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
