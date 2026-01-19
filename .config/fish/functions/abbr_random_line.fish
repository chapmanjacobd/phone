# Defined interactively
function abbr_random_line --argument-names name --argument-names path
    eval "function __abbr_random_line_$name; cat $path | lines.no.empty | shuf -n 1; end"
    abbr --add "$name" --function __abbr_random_line_$name
end
