function nextSong
    if pgrep -f 'lb lt'
        lb next --delete
    else
        ssh 10400 -o RemoteCommand=none lb next --delete
    end
end
