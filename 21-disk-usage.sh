#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem )
THRESHOLD=70

while IFS= read -r line
     do
        USAGE=$( echo $line | awk '{print $6}' | cut -d "%" -f1 )
        PARTITION=$( echo $line | awk '{print $7}' )
        if [ "$USAGE" ge $THRESHOLD ]; then
           MESSAGE="High Disk Usage on $PARTITION: $USAGE \n"

     done <<< "$DISK_USAGE"

     echo -e "$MESSAGE"