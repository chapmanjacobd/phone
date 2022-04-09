#!/bin/bash
SD=/storage/7728-84FA

URLS=( $(head -3 $SD/d/00_Metadata/tabs.txt) )
for url in $URLS; do
echo $url
  sleep 3
  termux-open-url $url
  sleep 3
echo $url
done

wait
# sed -i -e 1,2d ../d/00_Metadata/tabs.txt
