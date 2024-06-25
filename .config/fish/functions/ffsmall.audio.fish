# Defined interactively
function ffsmall.audio
    ffmpeg -i "$argv" -c:a libopus -ab 32k -ar 22050 -ac 1 (path change-extension small.opus "$argv")
end
