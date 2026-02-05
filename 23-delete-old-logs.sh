#!/bin/bash

R="\e[31m"
B="\e[32m"
Y="\e[33m"
N="\e[34m"

logs_dir="/home/ec2-user/app-logs"
logs_file="$log_dir/$0.log"

if [ ! -d $logs_dir ]; then
   echo -e "$R $logs_dir does not exist $N"
   exit 1
fi

files_to_delete=$(find $logs_dir -name "*.log" -mtime +14)
echo "$files_to_delete"

while IFS= read -r filepath
do
  echo "deleting file: $filepath"
done <<< $files_to_delete






