#!/bin/bash

USERID=$(id -u)
# this is to get the id of the root user as an input to our script
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" # /var/log/shell-script/log_file2.sh.log

if [ $USERID -ne 0 ]; then
echo "run with root access" | tee -a $LOGS_FILE
exit 1
fi

VALIDATE()
{
    if [ $2 -ne 0 ]; then
    echo "$2"
    echo "installing $1 is a .... failure" | tee -a $LOGS_FILE
    exit 1
    else
    echo "installing $1 is a .... success" | tee -a $LOGS_FILE
    fi
}


echo "I am continuing"
dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "mysql is already installed...Skipping" | tee -a $LOGS_FILE
else
    echo "installing mysql" | tee -a $LOGS_FILE
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE mysql $?
    
fi


dnf list installed nginx &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "nginx is already installed...Skipping" | tee -a $LOGS_FILE
else
    echo "installing nginx" | tee -a $LOGS_FILE
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi