#!/data/data/com.termux/files/usr/bin/fish

#fd -d1 . ~/sdcard/Download/ -ePNG -eWEBP -x mv {} ~/.shortcuts/icons/
fd . ~/.shortcuts/icons/ -eWEBP -x fish -c "convert {} {.}.png && rm {}"

set minimumWidth 512
set minimumHeight 512
for f in ~/.shortcuts/icons/*.png
    set imageWidth (identify -format "%w" "$f")
    set imageHeight (identify -format "%h" "$f")

    if [ "$imageWidth" -gt "$minimumWidth" ] || [ "$imageHeight" -gt "$minimumHeight" ]; then
        mogrify -resize ''"$minimumWidth"x"$minimumHeight"'' -gravity center -background transparent -extent 512x512 $f
    end
end

set INT /sdcard
set SD ~/ext

rm -rf $INT/Pictures/.thumbnails/
rm -rf $INT/Pictures/Instagram/
rm -rf $INT/Movies/Instagram/
rm -rf $INT/Movies/.thumbnails/
rm -rf $INT/Music/.thumbnails/

cp -R $INT/Pictures/Joey/* $SD/d/95_Memes/; and rm -rf $INT/Pictures/Joey/

cp -R $INT/Pictures/Screenshots/* $SD/d/60_Now_Viewing/; and rm -rf $INT/Pictures/Screenshots/

cp -R $INT/Pictures/* $SD/d/95_Memes/; and rm -rf $INT/Pictures/*

cp -R $INT/AudioRecorder/* $SD/d/87_Recordings/; and rm -rf $INT/AudioRecorder/*

cp -R $INT/Music/Sound\ records/* $SD/d/87_Recordings/; and rm -rf $INT/Music/Sound\ records/*

mv $INT/Download/* $SD/d/03_Downloads/

find $INT/ -empty -type d -delete
mkdir -p $INT/Pictures/
mkdir -p $INT/Download/

rm -rf $SD/Pictures/.thumbnails/
rm -rf $SD/Movies/.thumbnails/
rm -rf $SD/Music/.thumbnails/

find $SD/ -empty -type d -delete
cd $SD/github/curati && git add .;git commit -m wip;git pull;git push
