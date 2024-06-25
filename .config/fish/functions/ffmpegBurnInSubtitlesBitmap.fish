# Defined interactively
function ffmpegBurnInSubtitlesBitmap
    ffmpeg -i "$argv" -filter_complex "[0:v][0:s]overlay[v]" -map "[v]" -map 0:a (random-filename "$argv")
end
