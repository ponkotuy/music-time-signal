#!/bin/sh

TARGET=`date -d '1 hour' +'%D %H:00:00'`
TARGET_MILLIS=`date -d "$TARGET" +%s%3N`
NOW=`date +%s%3N`
DIFF=`echo "scale=3; ($TARGET_MILLIS - $NOW) / 1000.0" | bc`
echo "SLEEP $DIFF"
sleep $DIFF
mplayer -novideo /music/"$@"
