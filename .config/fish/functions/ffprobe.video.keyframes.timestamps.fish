# Defined interactively
function ffprobe.video.keyframes.timestamps
    ffprobe -v error -of default=noprint_wrappers=1:nokey=1 -select_streams v -skip_frame nokey -show_frames -show_entries frame=pkt_dts_time $argv
end
