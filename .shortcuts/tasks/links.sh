#!/bin/bash
head -7 ../d/00_Metadata/tabs.txt | xargs -n1 -t sh ./open-in-firefox.sh
sed -i -e 1,7d ../d/00_Metadata/tabs.txt
