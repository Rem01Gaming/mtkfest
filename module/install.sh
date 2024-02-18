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

ui_print "[*] Checking device compatibility"
chipset=$(grep "Hardware" /proc/cpuinfo | uniq | cut -d ':' -f 2 | sed 's/^[ \t]*//')
if [ -z "$chipset" ]; then
	export chipset=$(getprop "ro.hardware")
fi

if [[ ! $chipset == *MT* ]] && [[ ! $chipset == *mt* ]]; then
	abort "[-] This tweak is only for Mediatek devices, Aborted."
fi

if [[ ! $(uname -m) == "aarch64" ]]; then
	abort "[-] This module only supports aarch64 architecture, Aborted."
fi

ui_print "[*] Extracting module files"
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'mtkfest' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'service.sh' -d "$MODPATH" >&2
unzip -o "$ZIPFILE" 'gamelist.txt' -d "$MODPATH" >&2

ui_print "[*] Installing bellavita toast"
unzip -o "$ZIPFILE" 'toast.apk' -d $MODPATH >&2
pm install $MODPATH/toast.apk
rm $MODPATH/toast.apk

ui_print "[*] Setting permissions"
set_perm_recursive $MODPATH 0 0 0777 0777
chmod +x "$MODPATH"/mtkfest

ui_print "[+] Installation done! Please reboot this device."
