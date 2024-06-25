# Defined via `source`
function ffmpegFixAudioChromecast --wraps=ffmpeg
    set out (random-filename "$argv[1]")
    ffmpeg -nostdin -loglevel error -stats -i "$argv[1]" -map 0 -c:v copy -scodec webvtt -acodec libopus -ac 2 -b:a 96k -filter:a loudnorm=i=-18:lra=17 $argv[2..-1] $out
    and trash "$argv[1]"
    echo $out
end
