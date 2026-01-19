# Defined interactively
function args.or.stdin
    if count $argv >/dev/null
        printf "%s\n" $argv
    else
        cat
    end
end
