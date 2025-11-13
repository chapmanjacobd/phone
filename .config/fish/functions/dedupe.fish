# Defined interactively
function dedupe
    awk '!seen[$0]++' "$argv"
end
