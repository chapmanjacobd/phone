# Defined interactively
function ffprint
    python -c "from library.playback.playback_control import reformat_ffprobe; print(reformat_ffprobe('$argv'))"
end
