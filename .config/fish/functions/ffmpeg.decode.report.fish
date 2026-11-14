# Defined interactively
function ffmpeg.decode.report
    ffmpeg -nostdin -nostats -report -i $argv -f null /dev/null
end
