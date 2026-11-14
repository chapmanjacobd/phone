# Defined interactively
function ffprobe.has.audio
    ffprobe -show_streams -select_streams a -loglevel error -i "$argv" | count >/dev/null
end
