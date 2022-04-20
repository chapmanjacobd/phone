#!/data/data/com.termux/files/usr/bin/bash

INT=/sdcard
SD=~/d/

rm -rf $INT/Pictures/.thumbnails/
rm -rf $INT/Pictures/Instagram/
rm -rf $INT/Movies/.thumbnails/

cp -R $INT/Pictures/Joey/* $SD/d/92_Memes/
rm -rf $INT/Pictures/Joey/

cp -R $INT/Pictures/Screenshots/* $SD/d/62_Tax_Photos/
rm -rf $INT/Pictures/Screenshots/

cp -R $INT/Pictures/* $SD/d/92_Memes/
rm -rf $INT/Pictures/*

cp -R $INT/AudioRecorder/* $SD/d/84_Recordings/
rm -rf $INT/AudioRecorder/

cp -R $INT/Music/Sound\ records/* $SD/d/84_Recordings/
rm -rf $INT/Music/Sound\ records/

mv $INT/Download/* $SD/d/31_Downloads/

rm -rf $INT/Pictures/Instagram/
rm -rf $INT/Pictures/.thumbnails/
rm -rf $INT/Movies/.thumbnails/
rm -rf $INT/Music/.thumbnails/

find $INT/ -empty -type d -delete
mkdir -p $INT/Pictures/
mkdir -p $INT/Download/


rm -rf $SD/Pictures/.thumbnails/
rm -rf $SD/Movies/.thumbnails/
rm -rf $SD/Music/.thumbnails/

find $SD/ -empty -type d -delete
