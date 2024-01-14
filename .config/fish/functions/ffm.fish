function ffm
    ffmpeg -i “$argv” -vcodec libx264 -acodec aac (random-filename "$argv")
end
