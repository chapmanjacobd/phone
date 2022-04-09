#!/bin/bash
SD=/storage/7728-84FA

URLS=$(head -2 $SD/d/00_Metadata/tabs.txt)
echo $URLS
for url in $URLS; do
  echo 1
  ~/.shortcuts/tasks/open-browser.sh $url > /dev/null &
  # sleep 1
done

wait
# sed -i -e 1,2d $SD/d/00_Metadata/tabs.txt
