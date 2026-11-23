#!/system/bin/sh
# absolute reverse of nuke blurs
resetprop -n ro.launcher.blur.appLaunch 1
resetprop -n ro.surface_flinger.supports_background_blur 1
resetprop -n ro.sf.blurs_are_expensive 1
resetprop -n persist.sys.sf.disable_blurs false
resetprop -n enable_blurs_on_windows 1
resetprop -n disableBlurs false
resetprop -n ro.sf.blurs_are_caro 0
resetprop -n ro.miui.has_real_blur 1
resetprop -n persist.sys.background_blur_supported true
