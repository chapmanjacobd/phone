# Defined via `source`
function map
    parallel "echo {};$argv[1] {}" ::: $argv[2..-1]
end
