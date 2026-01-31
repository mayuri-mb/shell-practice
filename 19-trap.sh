#!/bin/bash
set -e 
trap 'echo "There is an error in $LINENO, command: $BASH_COMMAND"' ERR


echo " hello world"
echoo " I am learning shell"
echo "no printing error"