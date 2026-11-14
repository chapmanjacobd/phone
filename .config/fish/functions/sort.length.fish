# Defined interactively
function sort.length
    perl -e 'print sort { length($a) <=> length($b) } <>'
end
