# Defined interactively
function s
    cat "$argv[-1]" | $argv[1..-2] | sponge "$argv[-1]"
end
