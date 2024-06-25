# Defined interactively
function ffmpeg-check-corrupt
    ffmpeg -v error -i $argv -f null -
end
