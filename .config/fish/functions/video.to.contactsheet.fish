# Defined interactively
function video.to.contactsheet
    ffmpeg -i $argv -vf "select='gt(scene,0.4)',scale=1920:1080,tile" -vsync vfr (path.withsuffix .contactsheet.%03d -e jpg "$argv")
end
