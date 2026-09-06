#!/bin/bash

#Timestamp=$(date +%s)

Starttime=$(date +%s)

sleep 10;

Endtime=$(date +%s)

Totaltime=$(($Endtime-$Starttime))

echo "script executed in is $Totaltime seconds"
