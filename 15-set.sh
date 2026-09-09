#!/bin/bash

set -e

USERID=$(id -u)
# this is to get the id of the root user as an input to our script
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" # /var/log/shell-script/log_file2.sh.log

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m" # Red Color
G="\e[32m" # Green Color
Y="\e[33m" # Yellow Color
N="\e[0m" # Normal Color or White Color

trap 'echo "error at $LINENO", command: $BASH_COMMAND" ' ERR

if [ $USERID -ne 0 ]; then
echo "$TIMESTAMP [INFO] run with root access" | tee -a $LOGS_FILE
exit 1
fi

VALIDATE()
{
    if [ $2 -ne 0 ]; then
    echo "$2"
    echo -e "$TIMESTAMP [ERROR] installing $1 is a .... $R failure $N" | tee -a $LOGS_FILE
    exit 1
    else
    echo -e "$TIMESTAMP [INFO] installing $1 is a .... $G success $N" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    echo "$TIMESTAMP [INFO] Installing $package" | tee -a $LOGS_FILE

    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ] ; then
    dnf install $package &>> $LOGS_FILE
    VALIDATE "Installing $package" $?
    else
        echo -e "$TIMESTAMP [INFO]  $package already installed....$Y Skipping $N" | tee -a $LOGS_FILE
    fi

done