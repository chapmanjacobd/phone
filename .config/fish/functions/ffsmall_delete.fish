# Defined interactively
function ffsmall_delete
    ffsmall $argv
    and rm "$argv[1]"
end
