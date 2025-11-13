# Defined interactively
function morganize
    # Check if arguments are provided; if not, exit or handle default behavior
    if test (count $argv) -eq 0
        echo "Usage: morganize <file1> [<file2> ...]" >&2
        return 1
    end

    for f in $argv
        if string match -q -- $HOME'/.config/fish/functions/*.fish' "$f"
            fish_indent -w "$f"
        end

        if string match -q -- $HOME'/mc/*.txt' "$f"
            sort --unique --stable --ignore-case "$f" | sed '/^$/d' | sponge "$f"
        end

        if string match -q -- '*.list' "$f"
            s sorted "$f"
        end

        if string match -q -- '*/people.*list' "$f"
            dedupe "$f" | sort_by_last_name.py | sponge "$f"
        end
    end
end
