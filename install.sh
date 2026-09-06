#!/bin/bash

USERID=$(id -u)
# this is to get the id of the root user as an input to our script

if [ $USERID -ne 0 ]; then
echo "run with root access"
exit 1
fi

