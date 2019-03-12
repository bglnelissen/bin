#!/bin/bash
# Wake up screen when a certain display is found. Sometimes my Mac wakes but the display stays a sleep, this will fix the issue.
# b.nelissen

# cscreen: http://www.pyehouse.com/cscreen/

# wake up screen when one of these two displays are found
if [ "$(cscreen -l | grep '2b1052d0\|3c0c07c2')" != "" ]; then
    echo "Work display found"
    # Dell screen does not wake up, switch back and forth to wake her up
    cscreen -i 2b284050 -d 32 -x 1280 -y 1024 -r 75 # small dell screen
    cscreen -i 2b284050 -d 32 -x 1600 -y 1024 -r 60# small dell screen
    cscreen -i 3c0c07c2 -d 32 -x 1920 -y 1200 # big compaq screen
fi