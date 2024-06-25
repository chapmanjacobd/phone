# Defined via `source`
function ffa_delete
    ffa $argv; and trash-put "$argv[1]"
end
