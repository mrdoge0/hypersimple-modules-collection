#!/system/bin/sh
# sorry goolag, having to write this hurts me worse than this existing hurting you
# App Blacklister: Ban the installation of FSA bloatware that just keeps reinstalling themselves after you remove them.
#   A hyper simple daemon module to blacklist specific apps that you choose by writing their package IDs to "/data/adb/app_blacklist.txt".
#   It also tries to keep your Android device open and ironSource-free, via having Android Developer Verifier, 
#   and ironSource's over-permissioned ad service (and potentially Israeli spyware) apps AppCloud (that is usually seen in Samsung devices)
#   and AppServices (that is usually seen in Nothing devices) to the default blacklist.
#   Usage: "echo com.whatever.the.fuck.you.want.to.delete >> /data/adb/app_blacklist.txt"

# Set MODDIR
MODDIR=${0%/*}

# Log funcs
mLogI() {
  echo "[I] ${1}"
  log -p i -t 'App Blacklister by mrdoge0' "${1}"
}
mLogW() {
  echo "[W] ${1}"
  log -p w -t 'App Blacklister by mrdoge0' "${1}"
}
mLogE() {
  echo "[E] ${1}"
  log -p e -t 'App Blacklister by mrdoge0' "${1}"
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
