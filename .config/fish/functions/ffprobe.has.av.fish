# Defined interactively
function ffprobe.has.av
    if ffprobe.has.audio "$argv"; and ffprobe.has.video "$argv"
        return 0
    else
        return 1
    end
end
