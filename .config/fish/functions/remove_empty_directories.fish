# Defined interactively
function remove_empty_directories
    if set -q argv[1]
        $argv
    end

    find . -type d -empty -delete
end
