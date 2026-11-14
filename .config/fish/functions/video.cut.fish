function video.cut --argument file tin tout ct
    ffmpeg -nostats -hide_banner -loglevel error -ss "$tin". -i $file -c copy -to "$tout". (path.withsuffix ".$ct" "$file")
end
