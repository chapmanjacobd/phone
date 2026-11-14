# Defined interactively
function ffmpeg.decode
    ffmpeg -v error -i $argv -f null -
end
