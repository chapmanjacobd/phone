# Defined interactively
function ffmpeg
    command ffmpeg -hide_banner -loglevel warning -stats $argv
end
