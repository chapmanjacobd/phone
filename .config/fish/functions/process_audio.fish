function process_audio
    fd . $argv -H -tf -eDTS -eAAC -eWAV -eAIF -eAIFF -eFLAC -eAIFF -eM4A -eMP3 -eOGG -eMP4 -eWMA -j6 -x fish -c 'ffmpeg -hide_banner -loglevel warning -y -i "{}" -c:a libopus -ac 2 -b:a 128k -vbr constrained -filter:a loudnorm=i=-18:lra=17 "{.}".opus; rm "{}";'
end
