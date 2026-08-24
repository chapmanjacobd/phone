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

rm -rf $INT/Pictures/.thumbnails/
rm -rf $INT/Pictures/Instagram/
rm -rf $INT/Movies/Instagram/
rm -rf $INT/Movies/.thumbnails/
rm -rf $INT/Music/.thumbnails/

lb mv $INT/Pictures/ $INT/sync/image/
lb mv $INT/DCIM/ $INT/sync/image/
lb mv $INT/Android/media/com.whatsapp/WhatsApp/Media/ $INT/sync/image/

termux-media-scan -r $INT

set imageRoot $INT/sync/image
exiftool -r -d "$imageRoot/%Y-%m-%d" \
    -ext jpg -ext jpeg -ext png -ext webp -ext heic -ext heif -ext avif -ext gif -ext tif -ext tiff -ext jxl \
    '-Directory<FileModifyDate' '-Directory<CreateDate' '-Directory<DateTimeOriginal' \
    $imageRoot
lb process-image -y $imageRoot

lb mv $INT/AudioRecorder/ $INT/sync/audio/recordings/
lb mv $INT/Music/Sound\ records/ $INT/sync/audio/recordings/

lb mv $INT/Download/ $INT/sync/world/downloads/

find $INT/ -empty -type d -delete 2>/dev/null
mkdir -p $INT/Pictures/
mkdir -p $INT/Download/

find $INT/ -empty -type d -delete 2>/dev/null
cd ~/mc && git add .
git commit -m wip
git pull
git push
