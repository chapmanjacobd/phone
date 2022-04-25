#!/data/data/com.termux/files/usr/bin/bash
SD=~/d/
FILEN=${1:-tabs.txt}

URLS=$(head -7 $SD/00_Metadata/$FILEN)
for url in $URLS; do
  ~/.shortcuts/tasks/open-browser.sh "$url" > /dev/null &
  sleep 1
done
wait
sed -i -e 1,7d $SD/00_Metadata/$FILEN
