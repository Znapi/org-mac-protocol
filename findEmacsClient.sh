#!/bin/sh

for x in $(IFS=':';echo $EMACSCLIENT_SEARCH_PATHS); do
    if [ -e $x/emacsclient ]
    then
       echo $x/emacsclient
       break
    fi
done
