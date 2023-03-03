function nextSong
    if pgrep -f 'lb lt'
        lb next --delete
    else
        ssh pakon -o RemoteCommand=none lb next --delete
    end

end
