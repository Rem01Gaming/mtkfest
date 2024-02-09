#!/bin/sh
while [ -z "$(getprop sys.boot_completed)" ]; do
    sleep 5
done
/data/adb/modules/mtkfest/mtkfest > /dev/null 2>&1
