# Defined interactively
function ffreport
    ffmpeg -nostdin -nostats -report -i $argv -f null /dev/null
end
