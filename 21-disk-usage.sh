#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem )
THRESHOLD=10
SERVER_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

while IFS= read -r line
     do
        USAGE=$( echo $line | awk '{print $6}' | cut -d "%" -f1 )
        PARTITION=$( echo $line | awk '{print $7}' )
        if [ "$USAGE" -ge $THRESHOLD ]; then
           MESSAGE+="High Disk Usage on $PARTITION: $USAGE \n"
        fi
     done <<< "$DISK_USAGE"

     echo -e "$MESSAGE"

     sh mail.sh "DevOps Team" "High Risk Usage" "$SERVER_IP" "$MESSAGE" "krishnasredevops@gmail.com" "High Disk Usage Alert"