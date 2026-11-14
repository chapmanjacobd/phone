# Defined interactively
function ffprobe.json
    ffprobe -show_format -show_streams -of json $argv
end
