#!/data/data/com.termux/files/usr/bin/bash
SD=/storage/7728-84FA
FILEN=${1:-tabs.txt}

URLS=$(head -7 $SD/d/00_Metadata/$FILEN)
for url in $URLS; do
  url="$url" && [[ ! "$url" =~ ^http ]] && url="http://$url"
  ~/.shortcuts/tasks/open-browser.sh "$url" > /dev/null &
  sleep 1
done
wait
sed -i -e 1,7d $SD/d/00_Metadata/$FILEN
