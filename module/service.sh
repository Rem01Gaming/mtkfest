#!/bin/sh
while [ -z "$(getprop sys.boot_completed)" ]; do
    sleep 15
done
/data/adb/modules/mtkfest/mtkfest > /dev/null 2>&1
