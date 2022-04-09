#!/bin/bash
SD=/storage/7728-84FA

URLS=$(head -2 $SD/d/00_Metadata/tabs.txt)
for url in $URLS; do
  # ~/.shortcuts/tasks/open-browser.sh $url > /dev/null &
  termux-open-url $url > /dev/null &
  # sleep 1
done
# wait
# sed -i -e 1,7d $SD/d/00_Metadata/tabs.txt
