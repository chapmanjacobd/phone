#!/bin/bash
SD=/storage/7728-84FA

head -3 $SD/d/00_Metadata/tabs.txt

URLS=( $(head -3 $SD/d/00_Metadata/tabs.txt) )
echo $URLS
for url in $URLS; do
  echo $url
  ~/.shortcuts/tasks/open-browser.sh $url > /dev/null &
  # exec am start --user 0 -a android.intent.action.VIEW -W -d $url > /dev/null &
  # sleep 1
done

echo 'done?'
sleep 5
wait
# sed -i -e 1,2d $SD/d/00_Metadata/tabs.txt
