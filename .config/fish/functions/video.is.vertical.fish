# Defined interactively
function video.is.vertical --argument file
    set width (ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 "$file")
    set height (ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 "$file")

    #set rotate_tag (ffprobe -loglevel error -select_streams v:0 -show_entries stre>
    #test -n "$rotate_tag"; or set rotate_tag "0"

    #if test $rotate_tag != 0
    #    breakpoint
    #end

    if test $width -lt $height
        return 0
    else
        return 1
    end

end
