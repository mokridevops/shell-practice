#!/bin/bash

USERID=$(id -u)
# this is to get the id of the root user as an input to our script

if [ $USERID -ne 0 ]; then
echo "run with root access"
exit 1
fi


echo "I am continuing"
dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "mysql is already installed...Skipping"
else
    echo "installing mysql"
    dnf install mysql -y
    if [ $? -ne 0 ]; then
    echo "installing mysql is a .... failure"
    exit 1
    else
    echo "installing mysql is a .... success"
    fi
fi

