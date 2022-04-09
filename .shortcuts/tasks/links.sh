#!/bin/bash
head -2 ../d/00_Metadata/tabs.txt | xargs -n1 -t sh ./open-in-firefox.sh
sed -i -e 1,2d ../d/00_Metadata/tabs.txt
