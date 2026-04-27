#!/system/bin/sh

SKIPUNZIP=1

ui_print "**********************"
ui_print " DSA LineageOS "
ui_print " by daxd11 "
ui_print "**********************"
ui_print "- Version: v1.5.0"
ui_print "- Device: Redmi 10 2022 (selene)"

MODULE_ID="lineageos20_daxd11"
MODULES_UPDATE="/data/adb/modules_update/${MODULE_ID}"

mkdir -p "$MODULES_UPDATE"
unzip -o "$ZIPFILE" 'module.prop' -d "$MODULES_UPDATE" >&2

unzip -o "$ZIPFILE" 'service.sh' -d "$MODPATH" >&2

chmod 0755 "$MODPATH/service.sh"
chown root:root "$MODPATH/service.sh"

ui_print "- Reboot now !"
