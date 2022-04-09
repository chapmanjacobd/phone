#!/bin/bash
SD=/storage/7728-84FA

head -2 $SD/d/00_Metadata/tabs.txt | xargs -n1 -t sh $(pwd)/open-in-firefox.sh
# sed -i -e 1,2d ../d/00_Metadata/tabs.txt
