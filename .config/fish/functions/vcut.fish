function vcut --argument file tin tout ct
    set fl (string split -r -m1 . $file)
    ffmpeg -nostats -hide_banner -loglevel error -ss "$tin". -i $file -c copy -to "$tout". $fl[1].$ct.$fl[2]
end
