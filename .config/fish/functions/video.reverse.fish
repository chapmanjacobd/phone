# Defined interactively
function video.reverse
    ffmpeg -i "$argv" -vf reverse -af areverse (path.withsuffix .reversed "$argv")
end
