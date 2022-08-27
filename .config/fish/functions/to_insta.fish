function to_insta
    ffmpeg -i $argv -vf scale=-2:720 -c:v libx264 -profile:v main -level:v 3.0 -x264-params scenecut=0:open_gop=0:min-keyint=72:keyint=72 -c:a aac -preset slow -crf 23 -r 30 -sn -f mp4 OUTPUT.mp4
end
