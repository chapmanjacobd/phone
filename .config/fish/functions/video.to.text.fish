# Defined interactively
function video.to.text
    ffmpeg -i $argv -map 0:s:0 -f srt -
end
