#!/data/data/com.termux/files/usr/bin/env fish

#fd -d1 . ~/sdcard/Download/ -ePNG -eWEBP -x mv {} ~/.shortcuts/icons/
fd . ~/.shortcuts/icons/ -eWEBP -x fish -c "convert {} {.}.png && rm {}"

set minimumWidth 512
set minimumHeight 512
for f in ~/.shortcuts/icons/*.png
    set imageWidth (identify -format "%w" "$f")
    set imageHeight (identify -format "%h" "$f")

    if [ "$imageWidth" -gt "$minimumWidth" ] || [ "$imageHeight" -gt "$minimumHeight" ]
        then
        mogrify -resize ''"$minimumWidth"x"$minimumHeight"'' -gravity center -background transparent -extent 512x512 $f
    end
end

set INT /sdcard
set SD ~/ext

for dir in $INT $SD
    rm -rf $dir/Pictures/.thumbnails/
    rm -rf $dir/Pictures/Instagram/
    rm -rf $dir/Movies/Instagram/
    rm -rf $dir/Movies/.thumbnails/
    rm -rf $dir/Music/.thumbnails/

    rclone move $dir/Pictures/ $SD/d/90_Now_Viewing/
    rclone move $dir/DCIM/ $SD/d/90_Now_Viewing/
    rclone move $dir/Android/media/com.whatsapp/WhatsApp/Media/ $SD/d/90_Now_Viewing/
end

rclone move $INT/AudioRecorder/ $SD/d/87_Recordings/
rclone move $INT/Music/Sound\ records/ $SD/d/87_Recordings/

rclone move $INT/Download/ $SD/d/03_Downloads/

find $INT/ -empty -type d -delete 2>/dev/null
mkdir -p $INT/Pictures/
mkdir -p $INT/Download/

find $SD/ -empty -type d -delete 2>/dev/null
cd $SD/github/curati && git add .
git commit -m wip
git pull
git push
