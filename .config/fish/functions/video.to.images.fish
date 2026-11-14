# Defined interactively
function video.to.images
    ffmpeg -i "$argv" -vf "select='eq(pict_type,PICT_TYPE_I)'" -vsync vfr (path.withsuffix .%05d -e jpg "$argv")
end
