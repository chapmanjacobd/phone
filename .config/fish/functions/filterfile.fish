# Defined interactively
function filterfile --argument file word
    if test -n "$word"
        grep -i "$word" "$file"
        grep -iv "$word" "$file" | sponge "$file"
    end
end
