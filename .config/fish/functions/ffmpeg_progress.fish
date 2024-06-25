# Defined interactively
function ffmpeg_progress
    for pid in (pgrep ffmpeg)
        progress -p $pid
    end
end
