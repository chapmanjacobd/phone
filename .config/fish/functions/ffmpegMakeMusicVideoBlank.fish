function ffmpegMakeMusicVideoBlank
    ffmpeg -f lavfi -i color=c=black:s=1280x720:r=5 -i $argv -crf 0 -shortest (basename $argv).mp4
end
