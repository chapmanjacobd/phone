# Defined interactively
function ffa
    ffmpeg -i "$argv" -vn -y -c:a libopus -ac 2 -b:a 96k (path change-extension opus "$argv")
end
