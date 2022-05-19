function opentabs --argument qty file
    for tab in (head -$qty "$file")
        echo $tab
        ~/.shortcuts/tasks/open-browser.sh "$tab"
    end

    sed -i -e 1,"$qty"d "$file"
end
