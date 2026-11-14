# Defined interactively
function offset
    tail -n +(math 1+$argv[1]) $argv[2..]
end
