# Defined interactively
function ffsmall
    # while test (pgrep ffmpeg | count) -ge 3
    #    sleep (random_thousanths 0 5000)
    # end

    set filen (string split -r -m1 . "$argv[1]")[1]
    ffmpeg -nostdin -hide_banner -dn -y -i "$argv[1]" $argv[2..-1] -vf "scale=-2:min(ih\,1440)" -vcodec libx265 -preset 4 -acodec libopus "$filen".small.mkv
end
