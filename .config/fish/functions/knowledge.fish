# Defined interactively
function knowledge
    for l in $argv
        echo $l | sed 's|\.m\.|.|' >>~/j/lists/knowledge.list
    end
    sorted ~/j/lists/knowledge.list
end
