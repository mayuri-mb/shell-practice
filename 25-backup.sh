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
log "Days: $DAYS"

#Archive the files
if [ -z "$files" ]; then
  log "No files to archieve....$Y Skipping $N"
else
  #app-logs-$timestamp.zip
  log "Files found to archieve: $files"
  timestamp=$(date +%F-%H-%M-%S)
  ZIP_FILE_NAME="$DEST_DIR/app-logs-$timestamp.tar.gz"
  echo "Archieve name: $ZIP_FILE_NAME"
  find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | tar -zcvf $ZIP_FILE_NAME

  #check archieve is success or not

    if [ -f $ZIP_FILE_NAME ]; then
      log "Archieval is ....$G success $N"
      while IFS= read -r filepath;
      do
         echo "deleting file: $filepath"
         rm -f $filepath 
         echo "deleted file: $filepath"   | tee -a $logs_file
      done <<< "$files"
    else
      log "Archieval is ....$R failure $N"
      exit 1
    fi    
fi










