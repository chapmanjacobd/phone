#!/bin/bash
SD=/storage/7728-84FA

URLS=( $(head -2 $SD/d/00_Metadata/tabs.txt) )
for url in $URLS; do
  termux-open-url $url &
  sleep 1
done

wait
# sed -i -e 1,2d ../d/00_Metadata/tabs.txt
