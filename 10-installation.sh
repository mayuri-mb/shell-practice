#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Please run this script with root user access "
    exit 1
fi
     
echo "Installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "installing nginx is failed"
    exit 1
else
    echo "installing nginx is success"
fi 

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "installing mysql is failed"
    exit 1
else
    echo "installing mysql is success"
fi        

dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "installing nodejs is failed"
    exit 1
else
    echo "installing nodejs is success"
fi        