# Defined interactively
function ffprobe.codec
    ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 $argv | head -1
end
