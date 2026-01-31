#!/bin/bash
set -e #This will be checking for errors, if error, it will exit.
trap 'echo "There is an error in $LINENO, command : $BASH_COMMAND"' ERR

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

userid=$(id -u)
logs_folder="/var/logs/shell-script"
logs_file="/var/logs/shell-script/$0.log"

if [ $userid -ne 0 ]; then
   echo -e "$R Please run this script with root access $N" | tee -a $logs_file
   exit 1
fi

mkdir -p $logs_folder

for package in $@  # sudo sh 14-logs.sh nginx mysql nodejs
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
       echo "$package not installed, installing now"
       dnf install $package -y &>> $logs_file
    else
       echo -e "$package already installed, $Y skipping $N"
    fi    
done