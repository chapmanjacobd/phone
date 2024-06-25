# Defined interactively
function ffsmallgpu
    set filen (string split -r -m1 . "$argv[1]")[1] # TODO: add conditional vaapi_scale since -2,min() is not supported for vaapi_scale
    ffmpeg -nostdin -hide_banner -dn -y -hwaccel vaapi -vaapi_device /dev/dri/renderD128 -i "$argv[1]" -vf "format=vaapi|nv12,hwupload" -map 0 -vcodec hevc_vaapi $argv[2..-1] -acodec libopus -b:a 96k -vbr constrained "$filen".small.mkv
    #and /bin/rm "$argv[1]"
end
