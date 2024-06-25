# Defined interactively
function ffprobejson
    ffprobe -show_format -show_streams -of json $argv
end
