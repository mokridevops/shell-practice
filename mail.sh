#!/bin/bash

TO_TEAM=$1
ALERTY_TYPE=$2
SERVER_IP=$3
MESSAGE=$4
TO_ADDRESS=$5
SUBJECT=$6

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERTY_TYPE/$ALERTY_TYPE/g" -e "s/SERVER_IP/$SERVER_IP/g" -e "s/MESSAGE/$MESSAGE/g" template.html)


{
echo "To: $TO_TEAM"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"