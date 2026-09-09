#!/bin/bash

USERID=$(id -u)
# this is to get the id of the root user as an input to our script
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" # /var/log/shell-script/log_file2.sh.log

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ $USERID -ne 0 ]; then
echo $TIMESTAMP "run with root access" | tee -a $LOGS_FILE
exit 1
fi

VALIDATE()
{
    if [ $2 -ne 0 ]; then
    echo "$2"
    echo $TIMESTAMP "installing $1 is a .... failure" | tee -a $LOGS_FILE
    exit 1
    else
    echo $TIMESTAMP "installing $1 is a .... success" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    echo $TIMESTAMP "Installing $package"

    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ] ; then
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE "Installing $package" $?
    else
        echo $TIMESTAMP  "$package already installed....Skiping"
    fi

done