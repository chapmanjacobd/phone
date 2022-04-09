#!/bin/bash
SD=/storage/7728-84FA

URLS=( $(head -3 $SD/d/00_Metadata/tabs.txt) )
echo $URLS
for url in $URLS; do
  echo $url
  exec am start --user 0 -a android.intent.action.VIEW -W -d $url
  sleep 1
done

echo 'done?'
sleep 5
wait
# sed -i -e 1,2d $SD/d/00_Metadata/tabs.txt
