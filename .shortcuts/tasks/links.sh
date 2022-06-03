#!/data/data/com.termux/files/usr/bin/bash
SD=~/ext
FILEN=${1:-tabs.txt}

head -7 $SD/github/curati/$FILEN | while read url; do
  ~/.shortcuts/tasks/open-browser.sh "$url" > /dev/null &
  sleep 1
done
wait
sed -i -e 1,7d $SD/github/curati/$FILEN
