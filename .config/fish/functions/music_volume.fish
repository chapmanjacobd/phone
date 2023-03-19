function music_volume --argument change
    set current (termux-volume | jq -r '.[] | select(.stream == "music") | .volume')
    set max (termux-volume | jq -r '.[] | select(.stream == "music") | .max_volume')
    if test $change = up
        if test $current -lt $max
            set new (math $current + 1)
            termux-volume music $new >/dev/null
            echo "Music volume increased to $new"
        else
            echo "Music volume is already at maximum"
        end
    else if test $change = down
        if test $current -gt 0
            set new (math $current - 1)
            termux-volume music $new >/dev/null
            echo "Music volume decreased to $new"
        else
            echo "Music volume is already at minimum"
        end
    else
        echo "Invalid argument. Usage: music_volume [up|down]"
    end
end
