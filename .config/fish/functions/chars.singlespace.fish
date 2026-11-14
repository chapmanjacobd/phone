# Defined interactively
function chars.singlespace
    tr '\n' ' ' | tr -s ' '
end
