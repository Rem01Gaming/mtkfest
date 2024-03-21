#!/bin/sh
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true
REPLACE="

"
sleep 2
ui_print ""
ui_print "************************************"
ui_print "             MTKFEST Tweaks          "
ui_print "************************************"
ui_print "     By Telegram @Rem01Gaming     "
ui_print "************************************"
ui_print ""
sleep 2

ui_print "- Checking device compatibility"
chipset=$(grep "Hardware" /proc/cpuinfo | uniq | cut -d ':' -f 2 | sed 's/^[ \t]*//')
if [ -z "$chipset" ]; then
	export chipset=$(getprop "ro.hardware")
fi

if [[ ! $chipset == *MT* ]] && [[ ! $chipset == *mt* ]]; then
	abort "[-] This tweak is only for Mediatek devices, Aborted."
fi

sleep 1

ui_print "- Extracting module files"
mkdir /data/mtkfest
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'service.sh' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'gamelist.txt' -d "/data/mtkfest" >&2
echo 0 >/data/mtkfest/apu_freq_lock
echo 0 >/data/mtkfest/drop_cache_enabled
echo 0 >/data/mtkfest/idle_charging_enabled
echo 0 >/data/mtkfest/scheduler_switch_enabled

if pm list packages | grep -q bellavita.toast; then
ui_print "- The Bellavita Toast app is already installed, so doesn't need to install it again."
else
ui_print "- Bellavita Toast isn't installed"
ui_print "- Installing bellavita toast"
unzip -o "$ZIPFILE" 'toast.apk' -d $MODPATH >&2
pm install $MODPATH/toast.apk
rm -f $MODPATH/toast.apk
fi

set_perm_recursive $MODPATH 0 0 0777 0777
