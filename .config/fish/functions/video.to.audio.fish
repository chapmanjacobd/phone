# Defined interactively
function video.to.audio
    ffmpeg -i "$argv" -vn -y -c:a copy (path change-extension mka "$argv")
end
