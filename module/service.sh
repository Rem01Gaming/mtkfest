#!/bin/sh
while [ -z "$(getprop sys.boot_completed)" ]; do
    sleep 40
done
nice -n -20 mtkfest > /dev/null 2>&1
