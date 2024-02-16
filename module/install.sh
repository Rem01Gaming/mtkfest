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

# Check if chipset is Mediatek
chipset=$(grep "Hardware" /proc/cpuinfo | uniq | cut -d ':' -f 2 | sed 's/^[ \t]*//')
if [ -z "$chipset" ]; then
	export chipset=$(getprop "ro.hardware")
fi

if [[ ! $chipset == *MT* ]] && [[ ! $chipset == *mt* ]]; then
abort "[-] This tweak is only for Mediatek devices, Aborted."
fi

# Check if device is aarch64
if [[ ! $(uname -m) == "aarch64" ]]; then
abort "[-] This module only supports aarch64 machine, Aborted."
fi

ui_print "[+] Extracting module files"
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'mtkfest' -d "$MODPATH" >&2
set_perm_recursive $MODPATH 0 0 0777 0777
chmod +x "$MODPATH"/mtkfest
ui_print "[+] Installation done! Please reboot this device."
