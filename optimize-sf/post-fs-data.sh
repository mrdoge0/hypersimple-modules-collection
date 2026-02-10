#!/system/bin/sh
resetprop -n debug.sf.early_app_phase_offset_ns 500000
resetprop -n debug.sf.early_gl_app_phase_offset_ns 15000000
resetprop -n debug.sf.early_gl_phase_offset_ns 3000000
resetprop -n debug.sf.early_phase_offset_ns 500000
resetprop -n debug.sf.high_fps_early_gl_phase_offset_ns 650000
resetprop -n debug.sf.high_fps_early_phase_offset_ns 6100000
resetprop -n debug.sf.high_fps_late_app_phase_offset_ns 100000
resetprop -n debug.sf.phase_offset_threshold_for_next_vsync_ns 6100000
resetprop -n debug.sf.showbackground 0
resetprop -n debug.sf.showcpu 0
resetprop -n debug.sf.showfps 0
resetprop -n debug.sf.showupdates 0
resetprop -n ro.surface_flinger.force_hwc_copy_for_virtual_displays true
resetprop -n ro.surface_flinger.has_wide_color_display true
resetprop -n ro.surface_flinger.max_virtual_display_dimension 4096
resetprop -n ro.surface_flinger.protected_contents true
resetprop -n ro.surface_flinger.running_without_sync_framework true
resetprop -n ro.surface_flinger.use_color_management true
exit 0
