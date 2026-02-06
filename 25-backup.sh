#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
logs_file="$logs_folder/bkup.log"

R="\e[31m"
B="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is the default value, if the user not supplied

if [ $user_id -ne 0 ]; then
   echo -e "$R Please run this script with root user access $N"
   exit 1
fi

mkdir -p $logs_folder

usage () {
    echo -e "$R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS> [detault is 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
   usage
fi

log () {
    echo -e "$(date "+%Y-%m-%d %H:%M%S") | $1 "| tee -a $logs_file
}

if [ ! -d $SOURCE_DIR ]; then
   echo -e "$R Source directory: $SOURCE_DIR does not exist $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo -e "$R Destination directory: $DEST_DIR does not exist $N"
   exit 1
fi

#Find the files

files=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)
log "Backup started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days $DAYS"

#Archive the files
if [ -z $files ]; then
  log "No files to archieve....$Y Skipping $N"
fi










