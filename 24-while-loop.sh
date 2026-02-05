#!/bin/bash

count=1

# while [ $count -le 5 ]
# do
#     echo "count is $count"
#     sleep 1
#     #increments the counter
#     ((count++))
# done


while IFS= read -r line; 
do
#process each line in here
  echo "$line"
done <./20.trap.sh #input which file to read