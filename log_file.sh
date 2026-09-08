#!/bin/bash

USERID=$(id -u)
# this is to get the id of the root user as an input to our script
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log" # /home/ec2-user/shell-logs/log_file.sh.log

if [ $USERID -ne 0 ]; then
echo "run with root access"
exit 1
fi

VALIDATE()
{
    if [ $2 -ne 0 ]; then
    echo "installing $1 is a .... failure"
    exit 1
    else
    echo "installing $1 is a .... success"
    fi
}


echo "I am continuing"
dnf list installed mysql &>> LOGS_FILE

if [ $? -eq 0 ]; then
    echo "mysql is already installed...Skipping"
else
    echo "installing mysql"
    dnf install mysql -y &>> LOGS_FILE
    VALIDATE mysql $?
    
fi


dnf list installed nginx &>> LOGS_FILE

if [ $? -eq 0 ]; then
    echo "nginx is already installed...Skipping"
else
    echo "installing nginx"
    dnf install nginx -y &>>LOGS_FILE
    VALIDATE nginx $?
fi