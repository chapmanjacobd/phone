#!/bin/bash

SD=/storage/7728-84FA/d

rm -rf /sdcard/Pictures/.thumbnails/
rm -rf /sdcard/Pictures/Instagram/
rm -rf /sdcard/Movies/.thumbnails/

cp -R /sdcard/Pictures/Joey/* $SD/92_Memes/
rm -rf /sdcard/Pictures/Joey/

cp -R /sdcard/Pictures/Screenshots/* $SD/62_Tax_Photos/
rm -rf /sdcard/Pictures/Screenshots/

cp -R /sdcard/Pictures/* $SD/92_Memes/
rm -rf /sdcard/Pictures/*

cp -R /sdcard/AudioRecorder/* $SD/84_Recordings/
rm -rf /sdcard/AudioRecorder/

cp -R '/sdcard/Music/Sound records/'* $SD/84_Recordings/
rm -rf '/sdcard/Music/Sound records/'

mv /sdcard/Download/* $SD/31_Downloads/


rm -rf /sdcard/Pictures/Instagram/
rm -rf /sdcard/Pictures/.thumbnails/
rm -rf /sdcard/Movies/.thumbnails/
rm -rf /sdcard/Music/.thumbnails/

rm -rf $SD/Pictures/.thumbnails/
rm -rf $SD/Movies/.thumbnails/
rm -rf $SD/Music/.thumbnails/



find /sdcard/ -empty -type d -delete

mkdir -p /sdcard/Pictures/
mkdir -p /sdcard/Download/
