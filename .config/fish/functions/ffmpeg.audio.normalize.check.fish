# Defined interactively
function ffmpeg.audio.normalize.check
    command ffmpeg -hide_banner -i $argv -af volumedetect -vn -sn -dn -f null /dev/null
end
