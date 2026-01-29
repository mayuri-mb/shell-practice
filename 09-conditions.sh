#!/bin/bash

number=$1

# -gt -> greater than
# -lt -> less than
# -eq -> equal
# -ne -> not equal
if [ $number -gt 20]; then
    echo "given number: $number is greater than 20"
fi 