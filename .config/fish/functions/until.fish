# Defined interactively
function until
    while not fish -c (string join -- ' ' (string escape -- $argv))
        and :
    end
end
