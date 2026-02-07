#!/bin/bash
logs_folder="/var/log/shell-practice"
logs_file="$logs_folder/$0.log"

R="\e[32m"
G="\e[33m"
Y="\e[34m"
N="\e[0m"
MESSAGE=""

log () {
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $logs_file
}

DISK_USAGE=$(df -hT | grep -v Filesystem)
USAGE_THRESHOLD=3

while IFS= read -r line
do
  USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
  PARTITION=$(echo $line | awk '{print $7}')

  if [ "$USAGE" -ge "$USAGE_THRESHOLD" ]; then
      MESSAGE+="High Disk usage on $PARTITION:$USAGE \n"  # + means it appends data else it will override
  fi
done <<< $DISK_USAGE  

echo -e "$MESSAGE"

