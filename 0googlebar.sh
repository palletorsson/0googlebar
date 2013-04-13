#!/bin/bash

MONITOR=$1
LOGFILE="/tmp/0googlebar.log"

if [ -z $MONITOR ]
then
  echo "Please specify an interface."
  exit 1
fi

if [ -z $(which tcpdump) ]
then
  echo "tcpdump not in path, not installed?"
  exit 1
fi

GOOGLEFILTER="(port 80 or port 443) and (host google.com or host google.se)"
ANKAFILTER="(port 80 or port 443) and (host duckduckgo.com)"

tcpdump -i $MONITOR "$GOOGLEFILTER" | cut -d '.' -f1 | uniq | while read line
do
  echo "$line: KUKEN\! Someone used google\!" >> $LOGFILE
  ./0googlebar.pl g
done &

tcpdump -i $MONITOR "$ANKAFILTER" | cut -d '.' -f1 | uniq | while read line
do
  echo "$line: Anka\!" >> $LOGFILE
  ./0googlebar.pl d
done &

