#!/bin/bash
SD=/storage/7728-84FA

head -2 $SD/d/00_Metadata/tabs.txt | xargs -n1 -t -I{} bash 'termux-open-url {} && sleep 5'
# sed -i -e 1,2d ../d/00_Metadata/tabs.txt
