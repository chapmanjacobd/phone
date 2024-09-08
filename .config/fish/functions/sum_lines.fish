function sum_lines
    awk '{ sum += $1 } END { print sum }'
end
