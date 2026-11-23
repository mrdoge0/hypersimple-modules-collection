#!/system/bin/sh

# Check the SDK
case "$(getprop ro.build.version.sdk)" in
  '10000'|'37'|'36')
    # Canary, Cinnamon Bun or Baklava
    # Directly eligible (even 16 QPR0)
    ELIGIBLE='true';;
  '35')
    # Vanilla Ice Cream
    if [ -z "$(getprop ro.build.id | grep 'BP1A')" ]; then
      # QPR0 or QPR1
      # Not eligible
      ELIGIBLE='false'
    else
      # QPR2
      # Eligible but awfully incomplete
      ELIGIBLE='true'
    fi;;
  *)
    # Upside Down Cake or older
    ELIGIBLE='false'
esac

# That's the prop to enable Expressive on A16 QPR0 and fix the Permission Manager menus not being Expressive on LineageOS-based QPR1+.
${ELIGIBLE} && setprop is_expressive_design_enabled 1
