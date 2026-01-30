#!/bin/bash

userid=$(id -u)
logs_folder="/var/log/shell-script"
logs_file="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ]; then
   echo "Please run this script with root user access"
   exit 1
fi

mkdir -p $logs_folder

validate() {
    if [ $1 -ne 0 ]; then
       echo "$2 failed" | tee -a $logs_file
    else
       echo "$2 success" | tee -a $logs_file

    fi      
}

dnf install nginx -y &>> $logs_file
validate $? "installing nginx"

dnf install mysql -y  &>> $logs_file
validate $? "installing mysql"

dnf install nodejs -y &>> $logs_file
validate $? "installing nodejs"