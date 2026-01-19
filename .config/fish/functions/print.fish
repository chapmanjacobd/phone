# Defined interactively
function print
    if test -t 0
        printf "%s\n" $argv
    else
        tee /dev/tty
    end
end
