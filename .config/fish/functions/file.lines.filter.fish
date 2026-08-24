# Defined interactively
function file.lines.filter --argument-names file
    if not test -f "$file"
        echo "Error: '$file' is not a valid file." >&2
        return 1
    end

    for word in $argv[2..-1]
        if test -n "$word"
            grep -i "$word" "$file"
            grep -iv "$word" "$file" | sponge "$file"
        end
    end
end
