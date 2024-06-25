# Defined interactively
function ffmpeg.keyframes
    ffmpeg -i "$argv" -an -sn -filter:v "select='eq(pict_type,PICT_TYPE_I)',setpts=N/FRAME_RATE/TB" (path change-extension .keys.mkv "$argv")
end
