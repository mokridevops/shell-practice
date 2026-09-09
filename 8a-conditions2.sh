#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]; then
echo "entered number is greater than 100"
elif [ $NUMBER -eq 100 ]; then
echo "entered number is equal to 100"
else
echo "entered number is less than 100"
fi