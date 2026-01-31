#!/bin/bash

userid=$(id -u)
logs_folder="/var/logs/shell-script"
logs_file="/var/logs/shell-script/$0.log"

if [ $userid -ne 0 ]; then
   echo "Please run this script with root access"
   exit 1
fi

mkdir -p $logs_folder

validate() {
    if [ $1 -ne 0 ]; then
       echo "$2 failed"  | tee -a $logs_file
       exit 1
    else
       echo "$2 success" | tee -a $logs_file
    fi
}

for package in $@  # sudo sh 14-logs.sh nginx mysql nodejs
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
       echo "$package not installed, installing now"
       dnf install $package -y &>> $logs_file
       validate $? "$package installing"
    else
       echo "$package already installed, skipping"
    fi    
done