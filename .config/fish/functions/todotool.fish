# Defined interactively
function todotool
    cat (echo $argv | psub) ~/j/programming/todo_tools.md | sponge ~/j/programming/todo_tools.md
end
