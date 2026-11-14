# Defined via `source`
function timestamp --description 'usage: timestamp 1 week ago'
    date +%s -d "$argv"
end
