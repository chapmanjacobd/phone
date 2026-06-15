# Defined interactively
function cb.file
    if status --is-command-substitution
        cb | psub $argv
    else
        cat $argv | cb
    end
end
