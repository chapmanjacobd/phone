# Defined interactively
function ffprobe.video.frametypes
    ffprobe -v error -show_entries frame=pict_type,pkt_pts_time -of default=noprint_wrappers=1:nokey=1 -select_streams v:0 "$argv"
end
