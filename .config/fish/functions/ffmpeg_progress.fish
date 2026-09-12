# Defined interactively
function ffmpeg_progress
    for pid in (pgrep -f ffmpeg)
        progress -p $pid
    end
end
