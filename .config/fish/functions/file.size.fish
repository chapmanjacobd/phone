# Defined interactively
function file.size
    du -bc $argv | tail -n 1 | cut -f1
end
