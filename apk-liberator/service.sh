#!/system/bin/sh
# sorry goolag, having to write this hurts me worse than this existing hurting you

# Log funcs
mLogI() {
  echo "[I] ${1}"
  log -p i -t 'doge_hypersimple_apk_liberator' "${1}"
}
mLogW() {
  echo "[W] ${1}"
  log -p w -t 'doge_hypersimple_apk_liberator' "${1}"
}
mLogE() {
  echo "[E] ${1}"
  log -p e -t 'doge_hypersimple_apk_liberator' "${1}"
}

# Wait for phone to boot up, get out of BFU and get a bit more stable (logic stolen directly from Reveny's VBMeta Fixer, credits for reveny :D)
mLogI 'Waiting for unlocking BFU...'
until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 1
done
while [ ! -d /sdcard/Android ]; do
    sleep 1
done
while true; do
    if dumpsys activity activities | grep "mResumedActivity" | grep -qiE "launcher|lawnchair"; then
        break
    fi
    if dumpsys activity recents | grep "Recent #0" | grep -qiE "launcher|lawnchair"; then
        break
    fi
    sleep 1
done
sleep 10
mLogI 'Assuming BFU is no more.'

# Last package list
LASTPKGLIST='ofc this is dummy :3'

# your periodic function
while true; do
  # get current pkg list
  CURRPKGLIST="$(pm list packages)"

  # compare 'em
  if [ "${CURRPKGLIST}" != "${LASTPKGLIST}" ]; then
    # check if the nwo shit that's dev verifier now exists or not
    if echo "${CURRPKGLIST}" | grep 'package:com.google.android.verifier'; then
      # ALLAH AKBAR!!!
      pm uninstall --user 0 com.google.android.verifier
      EXCD="${?}"
      case ${EXCD} in
        0) mLogI 'NWO fuckery wiped out successfully'; LASTPKGLIST="$(pm list packages)";;
        *) mLogE "PM command failed with exit code ${EXCD}"; LASTPKGLIST="last uninstall fail with pm exit ${EXCD}";;
      esac
    else
      # just update last list if shit is tame for now
      mLogI 'target is not here for now'
      LASTPKGLIST="${CURRPKGLIST}"
    fi
  fi

  # wait 30 secs
  sleep 30
done
