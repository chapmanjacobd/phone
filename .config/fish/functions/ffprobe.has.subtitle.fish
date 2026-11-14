# Defined interactively
function ffprobe.has.subtitle --argument video
    # ffprobe -loglevel error -select_streams s:0 -show_entries stream=codec_type -of csv=p=0 input.mkv
    ffmpeg -i $video -c copy -map 0:s:0 -frames:s 1 -f null - -v 0 -hide_banner
end
