#!/bin/bash

userid=$(id -u)
logs-folder="/var/log/shell-script"
logs-file="/var/log/shell-script/$0.log

if [ $userid -ne 0 ]; then
   echo "Please run this script with root user access"
   exit 1
fi

mkdir -p $logs-folder

validate() {
    if [ $1 -ne 0 ]; then
       echo "$2 failed"
    else
       echo "$2 success"
    fi      
}

dnf install nginx -y &>> $logs-file
validate $? "installing nginx"

dnf install mysql -y  &>> $logs-file
validate $? "installing mysql"

dnf install nodejs -y &>> $logs-file
validate $? "installing nodejs"