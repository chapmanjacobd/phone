# Defined interactively
function ffprint
    python -c "from xklb.scripts.playback_control import reformat_ffprobe; print(reformat_ffprobe('$argv'))"
end
