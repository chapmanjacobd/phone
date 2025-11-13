# Defined interactively
function flattenDirectory
    find . -type f -exec mv --backup=numbered -t (pwd) {} +
    remove_empty_directories
end
