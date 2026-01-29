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