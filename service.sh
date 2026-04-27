#!/system/bin/sh

MODDIR=${0%/*}

until [ "$(getprop sys.boot_completed)" = "1" ]; do
    sleep 5
done

sleep 10

PACKAGES="
com.android.internal.systemui.navbar.twobutton
com.google.android.feedback
com.google.android.marvin.talkback
com.android.adservices.api
com.google.android.projection.gearhead
com.android.egg
com.google.android.apps.restore
com.android.carrierdefaultapp
org.lineageos.audiofx
org.lineageos.overlay.customization.blacktheme
com.miui.extraphoto
com.android.bookmarkprovider
org.lineageos.jelly
com.android.calllogbackup
com.android.cameraextensions
com.android.theme.icon_pack.circular.settings
com.android.theme.icon_pack.circular.systemui
com.android.theme.icon_pack.circular.launcher
com.android.theme.icon_pack.circular.android
com.android.backupconfirm
com.android.carrierconfig
com.android.carrierconfig.selene
com.android.dialer.auto_generated_rro_product__
com.android.dialer.overlay.selene
com.android.documentsui.overlay
com.android.emergency.auto_generated_rro_product__
com.android.frameworksres.overlay.selene
com.android.imsserviceentitlement.auto_generated_rro_product__
com.android.inputmethod.latin.auto_generated_rro_product__
com.android.launcher3.auto_generated_rro_product__
com.android.launcher3.overlay
com.android.managedprovisioning.auto_generated_rro_product__
com.android.nearby.halfsheet
com.android.networkstack.tethering.selene
com.android.ondevicepersonalization.services
com.android.providers.settings.auto_generated_rro_product__
com.android.settings.overlay.selene
com.android.settingsprovider.overlay.selene
com.android.sharedstoragebackup
com.android.storagemanager.auto_generated_rro_product__
com.android.systemui.overlay.selene
com.android.systemui.plugin.globalactions.wallet
com.android.telephony.overlay.selene
com.android.wallpaperbackup
com.mtg.gmsoverlay
com.mtg.gmssettingsprovideroverlay
com.android.dynsystem
com.android.theme.icon_pack.filled.settings
com.android.theme.icon_pack.filled.systemui
com.android.theme.icon_pack.filled.android
com.android.theme.icon_pack.filled.launcher
com.android.internal.systemui.navbar.gestural_wide_back
com.android.internal.systemui.navbar.gestural_extra_wide_back
com.android.internal.systemui.navbar.gestural
com.android.internal.systemui.navbar.gestural_narrow_back
com.google.android.googlequicksearchbox
com.android.emergency
com.android.theme.icon_pack.kai.settings
com.android.theme.icon_pack.kai.systemui
com.android.theme.icon_pack.kai.android
com.android.theme.icon_pack.kai.launcher
org.lineageos.etar
com.android.calculator2
com.android.providers.userdictionary
com.android.dreams.basic
org.lineageos.overlay.font.lato
com.android.bips
com.google.android.gm.exchange
com.android.nfc
lineageos.platform.auto_generated_rro_product__
org.calyxos.backup.contacts
org.lineageos.eleven
com.android.theme.font.notoserifsource
org.lineageos.lineageparts.auto_generated_rro_product__
org.lineageos.lineagesettings.auto_generated_rro_product__
org.lineageos.overlay.customization.navbar.nohint
org.lineageos.setupwizard.auto_generated_rro_product__
org.lineageos.updater.auto_generated_rro_product__
org.protonaosp.deviceconfig.auto_generated_rro_product__
org.lineageos.setupwizard
com.android.theme.icon.pebble
org.lineageos.updater
com.android.wallpaper.livepicker
com.android.htmlviewer
com.google.android.setupwizard
com.android.managedprovisioning
com.android.inputdevices
org.lineageos.recorder
com.android.cellbroadcastreceiver.module
com.android.internal.display.cutout.emulation.double
com.android.internal.display.cutout.emulation.hole
com.android.internal.display.cutout.emulation.corner
com.android.internal.display.cutout.emulation.tall
com.android.internal.display.cutout.emulation.waterfall
com.android.printservice.recommendation
com.android.printspooler
org.lineageos.profiles
com.android.theme.icon_pack.rounded.systemui
com.android.theme.icon_pack.rounded.android
com.android.theme.icon_pack.rounded.launcher
com.android.theme.icon_pack.rounded.settings
com.android.theme.icon.roundedrect
org.lineageos.overlay.font.rubik
com.android.theme.icon_pack.sam.settings
com.android.theme.icon_pack.sam.systemui
com.android.theme.icon_pack.sam.android
com.android.theme.icon_pack.sam.launcher
com.android.dreams.phototable
com.stevesoltys.seedvault
com.android.stk
org.protonaosp.deviceconfig
org.lineageos.settingsconfig
com.tencent.soter.soterserver
com.google.android.tts
com.android.theme.icon.square
com.android.theme.icon.squircle
com.android.theme.icon.taperedrect
com.android.theme.icon.teardrop
com.android.customization.themes
com.android.theme.icon.vessel
com.android.theme.icon_pack.victor.settings
com.android.theme.icon_pack.victor.systemui
com.android.theme.icon_pack.victor.launcher
com.android.theme.icon_pack.victor.android
org.lineageos.backgrounds
"

for PKG in $PACKAGES; do
    PKG="$(echo "$PKG" | tr -d '[:space:]')"
    [ -z "$PKG" ] && continue
    STATE=$(pm list packages "$PKG" 2>/dev/null)
    if [ -n "$STATE" ]; then
        pm disable-user --user 0 "$PKG" >/dev/null 2>&1
    fi
done
