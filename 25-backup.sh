#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell-practice"
log_file="$logs_dir/bkup.log"

R="\e[31m"
B="\e[32m"
Y="\e[33m"
N="\e[34m"
SOUREC_DIR=$1
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

if [ ! -d $SOURCE_DIR ]; then
   echo -e "$R $SOURCE_DIR does not exist $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo -e "$R $DEST_DIR does not exist $N"
   exit 1
fi





