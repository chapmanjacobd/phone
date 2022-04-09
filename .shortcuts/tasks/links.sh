#!/bin/bash
SD=/storage/7728-84FA

for url in
  ( $(head -2 $SD/d/00_Metadata/tabs.txt) )
; do
  termux-open-url $url &
done

# sed -i -e 1,2d ../d/00_Metadata/tabs.txt
