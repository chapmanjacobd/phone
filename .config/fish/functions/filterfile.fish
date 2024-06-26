# Defined interactively
function filterfile --argument file
    for word in $argv[2..-1]
        if test -n "$word"
            grep -i "$word" "$file"
            grep -iv "$word" "$file" | sponge "$file"
        end
    end
end
