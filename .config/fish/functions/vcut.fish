function vcut --argument file tin tout ct
    set fl (string split -r -m1 . $file)
    ffmpeg -ss $tin -i $file -c copy -to $tout $fl[1].$ct.$fl[2]
end
