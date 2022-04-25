function opentabs --argument qty file
for tab in  (head -$qty $file)
echo $tab
firefox $tab
end

sed -i -e 1,"$qty"d $file
end
