# Defined interactively
function commit
    if count $argv >/dev/null
        git utccommit -m "$argv"
    else
        git utccommit
    end
end
